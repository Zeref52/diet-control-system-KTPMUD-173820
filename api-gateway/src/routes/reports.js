const express = require('express');
const router = express.Router();

// POST /api/reports/generate
router.post('/generate', (req, res) => {
  const { startDate, endDate } = req.body;
  if (!startDate || !endDate) {
    return res.status(400).json({
      error: { message: 'startDate và endDate là bắt buộc', code: 'MISSING_FIELDS' }
    });
  }
  res.status(200).json({
    message: 'Tạo báo cáo thành công',
    reportId: `report-${Date.now()}`,
    fileUrl: 'https://mock-storage.example.com/reports/mock-report.pdf',
    startDate, endDate
  });
});

module.exports = router;