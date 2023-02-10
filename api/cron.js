require("dotenv").config()
const cron = require('node-cron')
const logger = require('./utils/APILogger')

const ia = require('./ia')

//CRON CONFIG
let HOUR_AI_SYNC = process.env.CRON_SYNC_AI
if (!HOUR_AI_SYNC) HOUR_AI_SYNC = 0

//Cron sync categories of database
cron.schedule(`0 ${HOUR_AI_SYNC} * * *`, async() => {
    logger.warning('Iniciando sicronização agendada. Gerando novos títulos com base em categorias aleatórias do banco de dados')
    await ia.startOpenAiSync()
    logger.warning('Sicronização agendada finalizada com sucesso')
});

//First start api
;(async() => {
    ia.startOpenAiSync()
})()