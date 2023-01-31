const { app } = require('../app')
const manager = require('./manager')
const logger = require("./utils/APILogger")
const LOG_TAG = 'router.js'

let artgRouters = []

app.get('/', (req, res) => {
    return res.render('article')
})

/* START DB ROUTERS */
module.exports.getArtgRouters = () => {
    return artgRouters
}

module.exports.mapRoutes = arr => {
    arr.map(f => {
        const path = '/articles/'+f.PAGE_PATH 
        logger.info('Mapeando novo caminho: ' + path, LOG_TAG)
        app.get(path, (req, res) => {
            req.article_id = f.ID_ARTICLE
            return manager.renderArticles(req, res)
        })

        artgRouters.push({ id : f.ID_ARTICLE, path })
    })
}