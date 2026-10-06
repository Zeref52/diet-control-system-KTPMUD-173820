const express = require('express');

const router = express.Router();

// POST /api/auth/register
router.post('/register', (req, res) => {
    const { email, password } = req.body;

    // Kiểm tra dữ liệu bắt buộc
    if (!email || !password) {
        return res.status(400).json({
            error: {
                message: 'Email và mật khẩu là bắt buộc',
                code: 'MISSING_FIELDS'
            }
        });
    }

    // Kiểm tra email
    if (!email.includes('@')) {
        return res.status(400).json({
            error: {
                message: 'Email không hợp lệ',
                code: 'INVALID_EMAIL'
            }
        });
    }

    // Kiểm tra độ dài mật khẩu
    if (password.length < 8) {
        return res.status(400).json({
            error: {
                message: 'Mật khẩu phải có ít nhất 8 ký tự',
                code: 'WEAK_PASSWORD'
            }
        });
    }

    // Mock response
    return res.status(201).json({
        message: 'Đăng ký thành công',
        userId: 'mock-uuid-1234',
        email: email
    });
});

// POST /api/auth/login
router.post('/login', (req, res) => {
    const { email, password } = req.body;

    // Kiểm tra dữ liệu bắt buộc
    if (!email || !password) {
        return res.status(400).json({
            error: {
                message: 'Email và mật khẩu là bắt buộc',
                code: 'MISSING_FIELDS'
            }
        });
    }

    // Mock login
    return res.status(200).json({
        message: 'Đăng nhập thành công',
        token: 'mock-jwt-token',
        user: {
            userId: 'mock-uuid-1234',
            email: email
        }
    });
});

module.exports = router;
