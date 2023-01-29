require('dotenv').config()
const promise = require('pg-promise')()

const USER = process.env.DB_USER
const PASSWORD = process.env.DB_PASSWORD
const DATABASE = process.env.DB_DATABASE
const HOST = process.env.DB_HOST
const PORT = process.env.DB_PORT

if (!USER) throw new Error('Env config not found: DB_USER, check your env file')
if (!PASSWORD) throw new Error('Env config not found: DB_PASSWORD, check your env file')
if (!DATABASE) throw new Error('Env config not found: DB_DATABASE, check your env file')
if (!HOST) throw new Error('Env config not found: DB_HOST, check your env file')
if (!PORT) throw new Error('Env config not found: DB_PORT, check your env file')

const url = `postgres://${USER}:${PASSWORD}@${HOST}:${PORT}/${DATABASE}`

const db = promise(url)

module.exports = {
    query: async(text, params) => await db.any(text, params)
}