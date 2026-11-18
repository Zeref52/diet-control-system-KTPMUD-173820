'use strict';

require('dotenv').config();

const { pool, testConnection } = require('./src/db/database');

async function main() {
    const connected = await testConnection();

    if (!connected) {
        process.exitCode = 1;
    }

    await pool.end();
}

main();