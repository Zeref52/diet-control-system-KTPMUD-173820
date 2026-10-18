
const express = require('express');
const router = express.Router();
const authMiddleware = require('../middleware/auth.middleware');

// Dữ liệu mô phỏng, chưa lưu vào PostgreSQL
let mockMeals = [];

const VALID_MEAL_TYPES = ['breakfast', 'lunch', 'dinner', 'snack'];
const VALID_UNITS = ['g', 'ml', 'serving'];

// Yêu cầu đăng nhập cho các API bữa ăn
router.use(authMiddleware);

// POST /api/meals
// Tạo bữa ăn mới
router.post('/', (req, res) => {
  const { mealType, date } = req.body;

  if (!mealType || !date) {
    return res.status(400).json({
      error: {
        message: 'mealType và date là bắt buộc',
        code: 'MISSING_FIELDS'
      }
    });
  }

  if (!VALID_MEAL_TYPES.includes(mealType)) {
    return res.status(400).json({
      error: {
        message: 'mealType phải là breakfast, lunch, dinner hoặc snack',
        code: 'INVALID_MEAL_TYPE'
      }
    });
  }

  // Kiểm tra ngày theo định dạng YYYY-MM-DD
  if (
    typeof date !== 'string' ||
    !/^\d{4}-\d{2}-\d{2}$/.test(date) ||
    !Number.isFinite(Date.parse(`${date}T00:00:00Z`)) ||
    new Date(`${date}T00:00:00Z`).toISOString().slice(0, 10) !== date
  ) {
    return res.status(400).json({
      error: {
        message: 'date phải là ngày hợp lệ theo định dạng YYYY-MM-DD',
        code: 'INVALID_DATE'
      }
    });
  }

  const newMeal = {
    mealId: `meal-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`,
    userId: req.user.userId,
    mealType,
    date,
    totalCalories: 0,
    items: []
  };

  mockMeals.push(newMeal);

  return res.status(201).json(newMeal);
});

// POST /api/meals/:mealId/items
// Thêm món ăn vào bữa ăn
router.post('/:mealId/items', (req, res) => {
  const { foodId, quantity, unit = 'g' } = req.body;

  const meal = mockMeals.find(
    m => m.mealId === req.params.mealId &&
         m.userId === req.user.userId
  );

  if (!meal) {
    return res.status(404).json({
      error: {
        message: 'Không tìm thấy bữa ăn',
        code: 'MEAL_NOT_FOUND'
      }
    });
  }

  if (!foodId || quantity == null) {
    return res.status(400).json({
      error: {
        message: 'foodId và quantity là bắt buộc',
        code: 'MISSING_FIELDS'
      }
    });
  }

  if (
    typeof quantity !== 'number' ||
    !Number.isFinite(quantity) ||
    quantity <= 0
  ) {
    return res.status(400).json({
      error: {
        message: 'quantity phải là số hữu hạn lớn hơn 0',
        code: 'INVALID_QUANTITY'
      }
    });
  }

  if (!VALID_UNITS.includes(unit)) {
    return res.status(400).json({
      error: {
        message: 'unit phải là g, ml hoặc serving',
        code: 'INVALID_UNIT'
      }
    });
  }

  const newItem = {
    itemId: `item-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`,
    foodId,
    quantity,
    unit
  };

  meal.items.push(newItem);

  // Chưa tính calories vì chưa kết nối dữ liệu dinh dưỡng của Foods.
  return res.status(201).json({
    message: 'Thêm món thành công',
    item: newItem,
    totalCalories: meal.totalCalories,
    nutritionCalculation: 'PENDING_FOOD_DATA'
  });
});

module.exports = router;
