const express = require('express');
const router = express.Router();
let mockGoals = {};

// GET /api/goals
router.get('/', (req, res) => {
  return res.status(200).json(mockGoals);
});

// POST /api/goals
router.post('/', (req, res) => {
  const {
    targetCalories,
    targetCarbs,
    targetProtein,
    targetFat
  } = req.body;

  // Kiểm tra thiếu dữ liệu
  if (
    targetCalories == null ||
    targetCarbs == null ||
    targetProtein == null ||
    targetFat == null
  ) {
    return res.status(400).json({
      error: {
        message: 'Các mục tiêu dinh dưỡng là bắt buộc',
        code: 'MISSING_FIELDS'
      }
    });
  }

  // Kiểm tra kiểu dữ liệu và giá trị
  const values = [
    targetCalories,
    targetCarbs,
    targetProtein,
    targetFat
  ];

  if (
    values.some(
      value => typeof value !== 'number' || value < 0
    )
  ) {
    return res.status(400).json({
      error: {
        message: 'Các mục tiêu phải là số không âm',
        code: 'INVALID_GOALS'
      }
    });
  }

  mockGoals = {
    targetCalories,
    targetCarbs,
    targetProtein,
    targetFat
  };

  return res.status(200).json({
    message: 'Cập nhật mục tiêu thành công',
    goals: mockGoals
  });
});

module.exports = router;
