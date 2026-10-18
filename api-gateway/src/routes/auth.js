const express = require('express');
const jwt = require('jsonwebtoken');

const router = express.Router();

// POST /api/auth/register
router.post('/register', (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({
            error: {
                message: 'Email và mật khẩu là bắt buộc',
                code: 'MISSING_FIELDS'
            }
        });
    }

    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        return res.status(400).json({
            error: {
                message: 'Email không hợp lệ',
                code: 'INVALID_EMAIL'
            }
        });
    }

    if (typeof password !== 'string' || password.length < 8) {
        return res.status(400).json({
            error: {
                message: 'Mật khẩu phải có ít nhất 8 ký tự',
                code: 'WEAK_PASSWORD'
            }
        });
    }

    // Mock response: chưa lưu tài khoản vào database
    return res.status(201).json({
        message: 'Đăng ký thành công (dữ liệu mô phỏng)',
        userId: 'mock-uuid-1234',
        email: email
    });
});

// POST /api/auth/login
router.post('/login', (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({
            error: {
                message: 'Email và mật khẩu là bắt buộc',
                code: 'MISSING_FIELDS'
            }
        });
    }

    const jwtSecret = process.env.JWT_SECRET;

    if (!jwtSecret) {
        return res.status(500).json({
            error: {
                message: 'Server chưa cấu hình JWT_SECRET',
                code: 'SERVER_CONFIG_ERROR'
            }
        });
    }

    // Mock login: chưa xác minh tài khoản trong database
    const user = {
        userId: 'mock-uuid-1234',
        email: email
    };

    const token = jwt.sign(
        {
            userId: user.userId,
            email: user.email
        },
        jwtSecret,
        { expiresIn: '1h' }
    );

    return res.status(200).json({
        message: 'Đăng nhập thành công (dữ liệu mô phỏng)',
        token: token,
        tokenType: 'Bearer',
        expiresIn: 3600,
        user: user
    });
});

module.exports = router;

