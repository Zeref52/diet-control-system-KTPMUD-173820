const express = require('express');
const router = express.Router();

let mockAlerts = [];

// GET /api/alerts
router.get('/', (req, res) => {
  res.status(200).json({ alerts: mockAlerts, unreadCount: mockAlerts.filter(a => !a.isRead).length });
});

// PUT /api/alerts/:alertId/read
router.put('/:alertId/read', (req, res) => {
  const alert = mockAlerts.find(a => a.alertId === req.params.alertId);
  if (alert) alert.isRead = true;
  res.status(200).json({ message: 'Đã đánh dấu đã đọc' });
});

module.exports = router;