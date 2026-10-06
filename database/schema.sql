-- =============================================
-- Hệ thống kiểm soát chế độ ăn
-- Database: PostgreSQL 14+
-- File: schema.sql
-- Mô tả: Script tạo cấu trúc CSDL cho Sprint 1
-- =============================================

CREATE DATABASE diet_control;
\c diet_control;
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Bảng users
CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL CHECK (email LIKE '%@%'),
    phone VARCHAR(20) UNIQUE CHECK (phone ~ '^[0-9]{10,11}$'),
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'user' CHECK (role IN ('user', 'admin')),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

-- Bảng profiles
CREATE TABLE profiles (
    profile_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    age INT CHECK (age > 0 AND age < 120),
    gender VARCHAR(10) CHECK (gender IN ('male', 'female', 'other')),
    height DECIMAL(5,2) CHECK (height > 0),
    weight DECIMAL(5,2) CHECK (weight > 0),
    activity_level VARCHAR(20) CHECK (activity_level IN ('sedentary', 'light', 'moderate', 'active', 'very_active')),
    medical_conditions TEXT[],
    allergies TEXT[]
);

-- Bảng foods
CREATE TABLE foods (
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
    is_verified BOOLEAN DEFAULT FALSE,
    created_by UUID REFERENCES users(user_id)
);

-- Bảng meals
CREATE TABLE meals (
    meal_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    meal_type VARCHAR(20) NOT NULL CHECK (meal_type IN ('breakfast', 'lunch', 'dinner', 'snack')),
    date DATE NOT NULL,
    total_calories DECIMAL(8,2) DEFAULT 0 CHECK (total_calories >= 0),
    total_carbs DECIMAL(8,2) DEFAULT 0 CHECK (total_carbs >= 0),
    total_protein DECIMAL(8,2) DEFAULT 0 CHECK (total_protein >= 0),
    total_fat DECIMAL(8,2) DEFAULT 0 CHECK (total_fat >= 0)
);

-- Bảng meal_items
CREATE TABLE meal_items (
    item_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    meal_id UUID NOT NULL REFERENCES meals(meal_id) ON DELETE CASCADE,
    food_id UUID NOT NULL REFERENCES foods(food_id),
    quantity DECIMAL(8,2) NOT NULL CHECK (quantity > 0),
    unit VARCHAR(20) NOT NULL DEFAULT 'g'
         CHECK (unit IN ('g', 'ml', 'pcs'))
);

-- Bảng goals
CREATE TABLE goals (
    goal_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL UNIQUE
        REFERENCES users(user_id) ON DELETE CASCADE,

    target_calories DECIMAL(8,2) NOT NULL
        CHECK (target_calories >= 0),

    target_carbs DECIMAL(8,2) NOT NULL
        CHECK (target_carbs >= 0),

    target_protein DECIMAL(8,2) NOT NULL
        CHECK (target_protein >= 0),

    target_fat DECIMAL(8,2) NOT NULL
        CHECK (target_fat >= 0),

    target_fiber DECIMAL(8,2)
        CHECK (target_fiber >= 0),

    target_sugar DECIMAL(8,2)
        CHECK (target_sugar >= 0),

    target_sodium DECIMAL(8,2)
        CHECK (target_sodium >= 0),

    start_date DATE,
    end_date DATE,

    updated_at TIMESTAMP DEFAULT NOW(),

    CHECK (end_date IS NULL OR start_date IS NULL OR start_date <= end_date)
);

-- Bảng alerts
CREATE TABLE alerts (
    alert_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    type VARCHAR(30) CHECK (type IN ('over_calories', 'over_carbs', 'over_sugar', 'over_sodium', 'missed_meal')),
    message TEXT,
    title VARCHAR(255) NOT NULL
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Bảng audit_logs
CREATE TABLE audit_logs (
    log_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(user_id),
    action_type VARCHAR(50) NOT NULL,
    entity_type VARCHAR(50),
    entity_id UUID,
    timestamp TIMESTAMP DEFAULT NOW(),
    status VARCHAR(20)
);
_ _ Bảng reports
CREATE TABLE reports (
    report_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    file_url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),

    CHECK (start_date <= end_date)
);

-- Indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_foods_name ON foods(name);
CREATE INDEX idx_foods_category ON foods(category);
CREATE INDEX idx_foods_verified ON foods(is_verified);
CREATE INDEX idx_meals_user_date ON meals(user_id, date);
CREATE INDEX idx_meal_items_meal ON meal_items(meal_id);
CREATE INDEX idx_meal_items_food ON meal_items(food_id);
CREATE INDEX idx_goals_user ON goals(user_id);
CREATE INDEX idx_alerts_user ON alerts(user_id, is_read);
CREATE INDEX idx_audit_logs_user ON audit_logs(user_id);
CREATE INDEX idx_audit_logs_timestamp ON audit_logs(timestamp);
CREATE INDEX idx_reports_user ON reports(user_id);
