require('dotenv').config()
const express = require('express')
const http = require('http')
const logger = require('./api/utils/APILogger')

const LOGTAG = 'app.js'

const HOST = process.env.SERVER_HOST
const PORT = process.env.SERVER_PORT

/* Express */

const app = express()

app.set('view engine', 'pug')
app.set('views', __dirname + '/public/')
app.set('view options', { pretty: true })

app.use('/pub', express.static('public/js'))
app.use('/pub', express.static('public/css'))
app.use('/assets', express.static('public/assets'))

const httpServer = http.createServer(app)
httpServer.listen(PORT, HOST, () => {
    logger.info(`Overnews API Iniciada, ouvindo na porta ${PORT}`, LOGTAG)
})

module.exports = {
    app : app
}

// STARTS CRON
require('./api/cron')