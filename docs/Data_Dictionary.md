# Từ điển dữ liệu (Data Dictionary)

Cơ sở dữ liệu: PostgreSQL 14+

---

## Bảng users

| Tên trường | Kiểu dữ liệu | Ràng buộc | Index | Check Constraint | Mô tả |
|------------|--------------|-----------|-------|------------------|-------|
| user_id | UUID | PK | PK index | - | Mã người dùng |
| email | VARCHAR(255) | UNIQUE, NOT NULL | Unique index | CHECK (email LIKE '%@%') | Email đăng nhập |
| phone | VARCHAR(20) | UNIQUE | Unique index | CHECK (phone ~ '^[0-9]{10,11}$') | Số điện thoại |
| password_hash | VARCHAR(255) | NOT NULL | - | - | Mật khẩu đã mã hóa |
| role | VARCHAR(20) | DEFAULT 'user' | B-tree | CHECK (role IN ('user', 'admin')) | Vai trò |
| created_at | TIMESTAMP | DEFAULT NOW() | B-tree | - | Ngày tạo |
| updated_at | TIMESTAMP | - | - | - | Ngày cập nhật |

---

## Bảng profiles

| Tên trường | Kiểu dữ liệu | Ràng buộc | Index | Check Constraint | Mô tả |
|------------|--------------|-----------|-------|------------------|-------|
| profile_id | UUID | PK | PK index | - | Mã hồ sơ |
| user_id | UUID | FK → users | B-tree | - | Mã người dùng |
| age | INT | - | - | CHECK (age > 0 AND age < 120) | Tuổi |
| gender | VARCHAR(10) | - | - | CHECK (gender IN ('male', 'female', 'other')) | Giới tính |
| height | DECIMAL(5,2) | - | - | CHECK (height > 0) | Chiều cao (cm) |
| weight | DECIMAL(5,2) | - | - | CHECK (weight > 0) | Cân nặng (kg) |
| activity_level | VARCHAR(20) | - | - | CHECK (activity_level IN ('sedentary', 'light', 'moderate', 'active', 'very_active')) | Mức vận động |
| medical_conditions | TEXT[] | - | GIN | - | Bệnh lý nền |
| allergies | TEXT[] | - | GIN | - | Dị ứng thực phẩm |

---

## Bảng foods

| Tên trường | Kiểu dữ liệu | Ràng buộc | Index | Check Constraint | Mô tả |
|------------|--------------|-----------|-------|------------------|-------|
| food_id | UUID | PK | PK index | - | Mã thực phẩm |
| name | VARCHAR(255) | NOT NULL | B-tree | - | Tên món ăn |
| category | VARCHAR(100) | - | B-tree | - | Nhóm thực phẩm |
| serving_size | DECIMAL(8,2) | - | - | CHECK (serving_size > 0) | Khối lượng tham chiếu (g) |
| calories | DECIMAL(8,2) | - | - | CHECK (calories >= 0) | Calo |
| carbs | DECIMAL(8,2) | - | - | CHECK (carbs >= 0) | Carbohydrate (g) |
| protein | DECIMAL(8,2) | - | - | CHECK (protein >= 0) | Protein (g) |
| fat | DECIMAL(8,2) | - | - | CHECK (fat >= 0) | Chất béo (g) |
| fiber | DECIMAL(8,2) | - | - | CHECK (fiber >= 0) | Chất xơ (g) |
| sugar | DECIMAL(8,2) | - | - | CHECK (sugar >= 0) | Đường (g) |
| sodium | DECIMAL(8,2) | - | - | CHECK (sodium >= 0) | Muối (mg) |
| is_verified | BOOLEAN | DEFAULT FALSE | B-tree | - | Đã kiểm duyệt |
| created_by | UUID | FK → users | B-tree | - | Người tạo |

---

## Bảng meals

| Tên trường | Kiểu dữ liệu | Ràng buộc | Index | Check Constraint | Mô tả |
|------------|--------------|-----------|-------|------------------|-------|
| meal_id | UUID | PK | PK index | - | Mã bữa ăn |
| user_id | UUID | FK → users | Composite (user_id, date) | - | Mã người dùng |
| meal_type | VARCHAR(20) | NOT NULL | - | CHECK (meal_type IN ('breakfast', 'lunch', 'dinner', 'snack')) | Loại bữa |
| date | DATE | NOT NULL | Composite (user_id, date) | - | Ngày |
| total_calories | DECIMAL(8,2) | DEFAULT 0 | - | CHECK (total_calories >= 0) | Tổng calo |
| total_carbs | DECIMAL(8,2) | DEFAULT 0 | - | CHECK (total_carbs >= 0) | Tổng carbohydrate |
| total_protein | DECIMAL(8,2) | DEFAULT 0 | - | CHECK (total_protein >= 0) | Tổng protein |
| total_fat | DECIMAL(8,2) | DEFAULT 0 | - | CHECK (total_fat >= 0) | Tổng chất béo |

---

## Bảng meal_items

| Tên trường | Kiểu dữ liệu | Ràng buộc | Index | Check Constraint | Mô tả |
|------------|--------------|-----------|-------|------------------|-------|
| item_id | UUID | PK | PK index | - | Mã chi tiết |
| meal_id | UUID | FK → meals | B-tree | - | Mã bữa ăn |
| food_id | UUID | FK → foods | B-tree | - | Mã thực phẩm |
| quantity | DECIMAL(8,2) | - | - | CHECK (quantity > 0) | Khối lượng |
| unit | VARCHAR(20) | DEFAULT 'g' | - | - | Đơn vị |

---

## Bảng goals

| Tên trường | Kiểu dữ liệu | Ràng buộc | Index | Mô tả |
|------------|--------------|-----------|-------|-------|
| goal_id | UUID | PK | PK index | Mã mục tiêu |
| user_id | UUID | FK → users | B-tree | Mã người dùng |
| target_calories | DECIMAL(8,2) | - | - | Mục tiêu calo |
| target_carbs | DECIMAL(8,2) | - | - | Mục tiêu carbohydrate |
| target_protein | DECIMAL(8,2) | - | - | Mục tiêu protein |
| target_fat | DECIMAL(8,2) | - | - | Mục tiêu chất béo |
| target_fiber | DECIMAL(8,2) | - | - | Mục tiêu chất xơ |
| target_sugar | DECIMAL(8,2) | - | - | Mục tiêu đường |
| target_sodium | DECIMAL(8,2) | - | - | Mục tiêu muối |
| start_date | DATE | - | - | Ngày bắt đầu |
| end_date | DATE | - | - | Ngày kết thúc |

---

## Bảng alerts

| Tên trường | Kiểu dữ liệu | Ràng buộc | Index | Mô tả |
|------------|--------------|-----------|-------|-------|
| alert_id | UUID | PK | PK index | Mã cảnh báo |
| user_id | UUID | FK → users | B-tree | Mã người dùng |
| type | VARCHAR(30) | - | B-tree | Loại cảnh báo |
| message | TEXT | - | - | Nội dung cảnh báo |
| is_read | BOOLEAN | DEFAULT FALSE | B-tree | Đã đọc |
| created_at | TIMESTAMP | DEFAULT NOW() | - | Ngày tạo |

---

## Bảng audit_logs

| Tên trường | Kiểu dữ liệu | Ràng buộc | Index | Mô tả |
|------------|--------------|-----------|-------|-------|
| log_id | UUID | PK | PK index | Mã log |
| user_id | UUID | FK → users | B-tree | Mã người dùng |
| action_type | VARCHAR(50) | NOT NULL | B-tree | Loại hành động |
| entity_type | VARCHAR(50) | - | - | Loại đối tượng |
| entity_id | UUID | - | - | Mã đối tượng |
| timestamp | TIMESTAMP | DEFAULT NOW() | B-tree | Thời gian |
| status | VARCHAR(20) | - | - | Trạng thái |
