const express = require('express');
const router = express.Router();

let mockGoals = {};

// GET /api/goals
router.get('/', (req, res) => {
  res.status(200).json(mockGoals);
});

// POST /api/goals
router.post('/', (req, res) => {
  const { targetCalories, targetCarbs, targetProtein, targetFat } = req.body;
  mockGoals = { targetCalories, targetCarbs, targetProtein, targetFat };
  res.status(200).json({ message: 'Cập nhật mục tiêu thành công', goals: mockGoals });
});

module.exports = router;