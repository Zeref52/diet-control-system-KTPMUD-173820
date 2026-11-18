'use strict';

const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT || 5432),
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
});

pool.on('error', (err) => {
    console.error('[PostgreSQL] Unexpected error:', err);
});

async function testConnection() {
    try {
        const result = await pool.query(
            'SELECT NOW() AS current_time'
        );

        console.log('[PostgreSQL] Connected successfully!');
        console.log('[PostgreSQL] Server time:', result.rows[0].current_time);

        return true;
    } catch (error) {
        console.error('[PostgreSQL] Connection failed:', error.message);
        return false;
    }
}

module.exports = {
    pool,
    testConnection,
};