const jwt = require('jsonwebtoken');

function authMiddleware(req, res, next) {
    const authHeader = req.headers.authorization;

    if (!authHeader || !authHeader.startsWith('Bearer ')) {
        return res.status(401).json({
            error: {
                message: 'Bạn cần đăng nhập',
                code: 'UNAUTHORIZED'
            }
        });
    }

    const token = authHeader.split(' ')[1];
    const jwtSecret = process.env.JWT_SECRET;

    if (!jwtSecret) {
        return res.status(500).json({
            error: {
                message: 'Server chưa cấu hình JWT_SECRET',
                code: 'SERVER_CONFIG_ERROR'
            }
        });
    }

    try {
        const decoded = jwt.verify(token, jwtSecret);
        req.user = decoded;
        next();
    } catch (error) {
        return res.status(401).json({
            error: {
                message: 'Token không hợp lệ hoặc đã hết hạn',
                code: 'INVALID_TOKEN'
            }
        });
    }
}

module.exports = authMiddleware;