-- =========================================================
-- HỆ THỐNG KIỂM SOÁT CHẾ ĐỘ ĂN
-- PostgreSQL 14+
-- File: database/schema.sql
--
-- Cách chạy:
--   1. Tạo database diet_control nếu chưa có.
--   2. Kết nối vào database diet_control.
--   3. Chạy file này bằng psql:
--        psql -U <user> -d diet_control -f schema.sql
--
-- Lưu ý: File này tạo cấu trúc bảng và chỉ mục, không tạo database.
-- =========================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ---------------------------------------------------------
-- 1. USERS
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) NOT NULL UNIQUE
        CHECK (email ~* '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$'),
    phone VARCHAR(20) UNIQUE
        CHECK (phone IS NULL OR phone ~ '^[0-9]{10,11}$'),
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'user'
        CHECK (role IN ('user', 'admin')),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);

-- ---------------------------------------------------------
-- 2. PROFILES
-- Mỗi người dùng có tối đa một hồ sơ.
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS profiles (
    profile_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL UNIQUE
        REFERENCES users(user_id) ON DELETE CASCADE,
    age INT CHECK (age > 0 AND age < 120),
    gender VARCHAR(10)
        CHECK (gender IN ('male', 'female', 'other')),
    height DECIMAL(5,2) CHECK (height > 0),
    weight DECIMAL(5,2) CHECK (weight > 0),
    activity_level VARCHAR(20)
        CHECK (activity_level IN (
            'sedentary', 'light', 'moderate', 'active', 'very_active'
        )),
    medical_conditions TEXT[],
    allergies TEXT[],
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP
);

-- ---------------------------------------------------------
-- 3. FOODS
-- Đơn vị dinh dưỡng phải được thống nhất trong dữ liệu:
-- calories: kcal; carbs/protein/fat/fiber/sugar/sodium: gram hoặc mg
-- theo quy ước được nhóm ghi rõ trong Data Dictionary.
-- serving_size là khối lượng/thể tích của khẩu phần được mô tả.
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS foods (
    food_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    serving_size DECIMAL(8,2) CHECK (serving_size > 0),
    calories DECIMAL(8,2) CHECK (calories >= 0),
    carbs DECIMAL(8,2) CHECK (carbs >= 0),
    protein DECIMAL(8,2) CHECK (protein >= 0),
    fat DECIMAL(8,2) CHECK (fat >= 0),
    fiber DECIMAL(8,2) CHECK (fiber >= 0),
    sugar DECIMAL(8,2) CHECK (sugar >= 0),
    sodium DECIMAL(8,2) CHECK (sodium >= 0),
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    created_by UUID REFERENCES users(user_id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_foods_name ON foods(name);
CREATE INDEX IF NOT EXISTS idx_foods_category ON foods(category);
CREATE INDEX IF NOT EXISTS idx_foods_verified ON foods(is_verified);

-- ---------------------------------------------------------
-- 4. MEALS
-- date được giữ theo tên cột trong schema ban đầu.
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS meals (
    meal_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL
        REFERENCES users(user_id) ON DELETE CASCADE,
    meal_type VARCHAR(20) NOT NULL
        CHECK (meal_type IN ('breakfast', 'lunch', 'dinner', 'snack')),
    date DATE NOT NULL,
    total_calories DECIMAL(8,2) NOT NULL DEFAULT 0
        CHECK (total_calories >= 0),
    total_carbs DECIMAL(8,2) NOT NULL DEFAULT 0
        CHECK (total_carbs >= 0),
    total_protein DECIMAL(8,2) NOT NULL DEFAULT 0
        CHECK (total_protein >= 0),
    total_fat DECIMAL(8,2) NOT NULL DEFAULT 0
        CHECK (total_fat >= 0),
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_meals_user_date ON meals(user_id, date);

-- ---------------------------------------------------------
-- 5. MEAL_ITEMS
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS meal_items (
    item_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    meal_id UUID NOT NULL
        REFERENCES meals(meal_id) ON DELETE CASCADE,
    food_id UUID NOT NULL
        REFERENCES foods(food_id) ON DELETE RESTRICT,
    quantity DECIMAL(8,2) NOT NULL CHECK (quantity > 0),
    unit VARCHAR(20) NOT NULL DEFAULT 'g'
        CHECK (unit IN ('g', 'ml', 'pcs')),
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_meal_items_meal ON meal_items(meal_id);
CREATE INDEX IF NOT EXISTS idx_meal_items_food ON meal_items(food_id);

-- ---------------------------------------------------------
-- 6. GOALS
-- Một người dùng có tối đa một mục tiêu đang được lưu trong bảng.
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS goals (
    goal_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL UNIQUE
        REFERENCES users(user_id) ON DELETE CASCADE,
    target_calories DECIMAL(8,2) NOT NULL CHECK (target_calories >= 0),
    target_carbs DECIMAL(8,2) NOT NULL CHECK (target_carbs >= 0),
    target_protein DECIMAL(8,2) NOT NULL CHECK (target_protein >= 0),
    target_fat DECIMAL(8,2) NOT NULL CHECK (target_fat >= 0),
    target_fiber DECIMAL(8,2) CHECK (target_fiber >= 0),
    target_sugar DECIMAL(8,2) CHECK (target_sugar >= 0),
    target_sodium DECIMAL(8,2) CHECK (target_sodium >= 0),
    start_date DATE,
    end_date DATE,
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    CHECK (
        start_date IS NULL
        OR end_date IS NULL
        OR start_date <= end_date
    )
);

-- UNIQUE(user_id) đã tạo chỉ mục cho user_id; không tạo index trùng.
-- ---------------------------------------------------------
-- 7. ALERTS
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS alerts (
    alert_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL
        REFERENCES users(user_id) ON DELETE CASCADE,
    type VARCHAR(30) NOT NULL
        CHECK (type IN (
            'over_calories', 'over_carbs', 'over_sugar',
            'over_sodium', 'missed_meal'
        )),
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_alerts_user_read
    ON alerts(user_id, is_read);

-- ---------------------------------------------------------
-- 8. AUDIT_LOGS
-- Giữ lịch sử thao tác kể cả khi tài khoản bị xóa; user_id thành NULL.
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS audit_logs (
    log_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(user_id) ON DELETE SET NULL,
    action_type VARCHAR(50) NOT NULL,
    entity_type VARCHAR(50),
    entity_id UUID,
    timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
    status VARCHAR(20)
        CHECK (status IS NULL OR status IN ('success', 'failure'))
);

CREATE INDEX IF NOT EXISTS idx_audit_logs_user ON audit_logs(user_id);
CREATE INDEX IF NOT EXISTS idx_audit_logs_timestamp ON audit_logs(timestamp);

-- ---------------------------------------------------------
-- 9. REPORTS
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS reports (
    report_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL
        REFERENCES users(user_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    file_url TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    CHECK (start_date <= end_date)
);

CREATE INDEX IF NOT EXISTS idx_reports_user ON reports(user_id);

-- ---------------------------------------------------------
-- 10. DELEGATIONS
-- Đề xuất bổ sung cho chức năng ủy quyền người nhà.
-- owner_user_id: người cấp quyền; delegate_user_id: người được cấp quyền.
-- ---------------------------------------------------------
CREATE TABLE IF NOT EXISTS delegations (
    delegation_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    owner_user_id UUID NOT NULL
        REFERENCES users(user_id) ON DELETE CASCADE,
    delegate_user_id UUID NOT NULL
        REFERENCES users(user_id) ON DELETE CASCADE,
    permission VARCHAR(30) NOT NULL
        CHECK (permission IN ('enter_data', 'view_reports', 'both')),
    status VARCHAR(20) NOT NULL DEFAULT 'pending'
        CHECK (status IN ('pending', 'accepted', 'rejected', 'revoked')),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP,
    expires_at TIMESTAMP,
    CHECK (owner_user_id <> delegate_user_id),
    CHECK (expires_at IS NULL OR expires_at > created_at),
    UNIQUE (owner_user_id, delegate_user_id)
);

CREATE INDEX IF NOT EXISTS idx_delegations_owner_status
    ON delegations(owner_user_id, status);
CREATE INDEX IF NOT EXISTS idx_delegations_delegate_status
    ON delegations(delegate_user_id, status);

-- =========================================================
-- Ghi chú đồng bộ tài liệu:
-- 1. Cập nhật ERD và Data Dictionary theo đúng các bảng/cột ở trên.
-- 2. Bảng meals dùng cột "date", không phải "meal_date".
-- 3. Bảng meal_items có created_at.
-- 4. Bảng profiles có UNIQUE(user_id), quan hệ USERS 1:1 PROFILES.
-- 5. Bảng delegations là phần bổ sung đề xuất; xác nhận với SRS trước khi nộp.
-- 6. PostgreSQL tự tạo index cho PRIMARY KEY và UNIQUE constraints.
-- =========================================================
