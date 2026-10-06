const express = require('express');
const router = express.Router();

const mockFoods = [
  {
    foodId: '1',
    name: 'Phở bò',
    calories: 450,
    carbs: 65,
    protein: 25,
    fat: 12
  },
  {
    foodId: '2',
    name: 'Phở gà',
    calories: 400,
    carbs: 60,
    protein: 22,
    fat: 10
  },
  {
    foodId: '3',
    name: 'Bún chả',
    calories: 520,
    carbs: 70,
    protein: 28,
    fat: 15
  },
  {
    foodId: '4',
    name: 'Cơm tấm',
    calories: 600,
    carbs: 85,
    protein: 25,
    fat: 18
  },
  {
    foodId: '5',
    name: 'Bánh mì thịt',
    calories: 450,
    carbs: 55,
    protein: 18,
    fat: 16
  }
];

// GET /api/foods/search?q=phở&limit=20
router.get('/search', (req, res) => {
  const { q, limit = 20 } = req.query;

  if (!q) {
    return res.status(400).json({
      error: {
        message: 'Thiếu tham số q',
        code: 'MISSING_PARAM'
      }
    });
  }

  const parsedLimit = parseInt(limit);

  if (isNaN(parsedLimit) || parsedLimit <= 0) {
    return res.status(400).json({
      error: {
        message: 'limit phải là số nguyên dương',
        code: 'INVALID_LIMIT'
      }
    });
  }

  const results = mockFoods
    .filter(food =>
      food.name.toLowerCase().includes(q.toLowerCase())
    )
    .slice(0, parsedLimit);

  return res.status(200).json({
    query: q,
    total: results.length,
    results
  });
});

// GET /api/foods/:foodId
router.get('/:foodId', (req, res) => {
  const food = mockFoods.find(
    food => food.foodId === req.params.foodId
  );

  if (!food) {
    return res.status(404).json({
      error: {
        message: 'Không tìm thấy món ăn',
        code: 'FOOD_NOT_FOUND'
      }
    });
  }

  return res.status(200).json(food);
});

module.exports = router;
