require("dotenv").config()
const cron = require('node-cron')
const logger = require('./utils/APILogger')

const ia = require('./ia')

//CRON CONFIG
let HOUR_AI_SYNC = process.env.CRON_SYNC_AI
let HOUR_DATABASE_SYNC = process.env.CRON_EVERY_DATABASE_HOUR
if (!HOUR_AI_SYNC) HOUR_AI_SYNC = 0
if (!HOUR_DATABASE_SYNC) HOUR_DATABASE_SYNC = 4

//Cron sync categories of database
cron.schedule(`0 */${HOUR_DATABASE_SYNC} * * *`, async() => {
    logger.warning('Iniciando sicronização agendada. Gerando novos títulos com base em categorias aleatórias do banco de dados')
    await ia.startSync(true)
    logger.warning('Sicronização agendada finalizada com sucesso')
});

//Cron sync categories of Openai
cron.schedule(`0 ${HOUR_AI_SYNC} * * *`, async() => {
    logger.warning('Iniciando sicronização agendada. Gerando novos títulos com base em categorias aleatórias da API Openai')
    await ia.startSync(false)
    logger.warning('Sicronização agendada finalizada com sucesso')
});

//First start api
ia.startSync(false)
