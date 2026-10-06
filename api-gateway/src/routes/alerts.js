const express = require('express');
const router = express.Router();

let mockAlerts = [
  {
    alertId: 'alert-001',
    title: 'Nhắc nhở bữa trưa',
    message: 'Bạn chưa ghi chép bữa trưa hôm nay.',
    isRead: false
  },
  {
    alertId: 'alert-002',
    title: 'Theo dõi dinh dưỡng',
    message: 'Hãy cập nhật bữa ăn để theo dõi lượng dinh dưỡng.',
    isRead: true
  }
];

// GET /api/alerts
router.get('/', (req, res) => {
  res.status(200).json({
    alerts: mockAlerts,
    unreadCount: mockAlerts.filter(alert => !alert.isRead).length
  });
});

// PUT /api/alerts/:alertId/read
router.put('/:alertId/read', (req, res) => {
  const alert = mockAlerts.find(
    alert => alert.alertId === req.params.alertId
  );

  if (!alert) {
    return res.status(404).json({
      error: {
        message: 'Không tìm thấy cảnh báo',
        code: 'ALERT_NOT_FOUND'
      }
    });
  }

  alert.isRead = true;

  res.status(200).json({
    message: 'Đã đánh dấu cảnh báo là đã đọc',
    alertId: alert.alertId
  });
});

module.exports = router;
