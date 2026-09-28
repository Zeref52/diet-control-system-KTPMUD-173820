const express = require('express');
const router = express.Router();

let mockMeals = [];

// POST /api/meals
router.post('/', (req, res) => {
  const { mealType, date } = req.body;
  if (!mealType || !date) {
    return res.status(400).json({
      error: { message: 'mealType và date là bắt buộc', code: 'MISSING_FIELDS' }
    });
  }
  const newMeal = {
    mealId: `meal-${Date.now()}`,
    mealType, date, totalCalories: 0, items: []
  };
  mockMeals.push(newMeal);
  res.status(201).json(newMeal);
});

// POST /api/meals/:mealId/items
router.post('/:mealId/items', (req, res) => {
  const { foodId, quantity, unit = 'g' } = req.body;
  const meal = mockMeals.find(m => m.mealId === req.params.mealId);
  if (!meal) {
    return res.status(404).json({
      error: { message: 'Không tìm thấy bữa ăn', code: 'MEAL_NOT_FOUND' }
    });
  }
  if (!foodId || !quantity) {
    return res.status(400).json({
      error: { message: 'foodId và quantity là bắt buộc', code: 'MISSING_FIELDS' }
    });
  }
  const newItem = { itemId: `item-${Date.now()}`, foodId, quantity, unit };
  meal.items.push(newItem);
  meal.totalCalories += 450;
  res.status(200).json({
    message: 'Thêm món thành công',
    item: newItem,
    totalCalories: meal.totalCalories
  });
});

module.exports = router;