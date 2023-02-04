require('dotenv').config()
const logger = require("./utils/APILogger")
const db = require('./database/db')
const LOG_TAG = 'manager.js'

/* Sitemap */
const { SitemapStream, streamToPromise } = require('sitemap')
const { createGzip } = require('zlib')
const { Readable } = require('stream')

let sitemapData = null

const PAGE_URL = process.env.SITE_URL
const PAGE_SIZE = 30
let QTD_KEYWORDS = process.env.QTD_KEYWORDS

if (!QTD_KEYWORDS || QTD_KEYWORDS.length === 0) QTD_KEYWORDS = 5

function makeArticleObj(q) {
    return {
        id_article : q.id_article,
        title : q.title,
        page_path : q.page_path,
        content : q.content,
        created : new Date(q.created).toDateString(),
        updated : new Date(q.created).toDateString(),
        id_category : q.id_category,
        category_content : q.category_content,
        files : [],
        keywords : []
    }
}

module.exports = {

    makeSitemap : async() => {
        try {
            logger.warning('Gerando um novo esquema de Sitemap.xml')
    
            let qs = await db.query(`
                SELECT "PAGE_PATH" FROM "ARTICLE"
                ORDER BY "ID_ARTICLE" DESC
                LIMIT 10000
            `)
    
            links = qs.map(f => f = {
                url : '/articles/'+f.PAGE_PATH,
                changefreq : 'daily',
                priority : 0.3
            })
    
            const smStream = new SitemapStream({
                hostname : PAGE_URL
            })
            const pipeline = smStream.pipe(createGzip())
    
            Readable.from(links).pipe(smStream)
    
            streamToPromise(pipeline).then(sm => {
                sitemapData = sm
                smStream.end()
            })
        
        } catch (err) {
            logger.error('Erro ao sicronizar urls no sitemap.xml. Err: '+err.toString())
            sitemapData = null
        }
    },

    sitemap : async(req, res) => {
        res.header('Content-Type', 'application/xml')
        res.header('Content-Encoding', 'gzip')

        if (!sitemapData) return res.status(500).end()

        return res.send(sitemapData)
    },

    home : async(req, res) => {
        let qs = []
        try {
            qs = await db.query(`
                SELECT
                    ATG."ID_ARTICLE" as ID_ARTICLE,
                    ATG."TITLE" as TITLE,
                    ATG."CONTENT" as CONTENT,
                    ATG."CREATED" as CREATED,
                    ATG."UPDATED" as UPDATED,
                    ATG."PAGE_PATH" as PAGE_PATH,
                    CT."ID_CATEGORY" as ID_CATEGORY, 
                    CT."CONTENT" as CATEGORY_CONTENT
                FROM "ARTICLE" ATG
                INNER JOIN "ARTG_CATEGORY" CT ON CT."ID_CATEGORY" = ATG."ID_CATEGORY"
                ORDER BY random() DESC
                LIMIT $1
            `, [PAGE_SIZE])
        } catch (err) {}

        let cs = []
        try {
            cs = await db.query(`
                SELECT
                    "ID_ARTICLE_KEYWORD",
                    "ID_ARTICLE",
                    "CONTENT"
                FROM
                    "ARTICLE_KEYWORD"
                ORDER BY "ID_ARTICLE" DESC
                LIMIT ($1 * $2)
            `, [PAGE_SIZE, QTD_KEYWORDS])
        } catch (err) {}

        let ft = []
        try {
            ft = await db.query(`
                SELECT
                    FL."ID_ARTICLE",
                    F."ID_FILE",
                    F."FILENAME",
                    F."MIMETYPE",
                    F."ORIGIN_URL",
                    F."WIDTH",
                    F."HEIGHT",
                    F."COLOR"
                FROM
                    "FILE" F
                INNER JOIN "ARTICLE_FILE" FL ON F."ID_FILE" = FL."ID_FILE"
                ORDER BY FL."ID_ARTICLE" DESC
                LIMIT ($1 * 2)
            `, [PAGE_SIZE])

        } catch (err) { throw err}

        let articles = qs.map(q => {
            let article = makeArticleObj(q)
            if (article.content.length > 120)
                article.content = article.content.substr(0, 150) + '... (Clique para Continuar lendo)'

            article.keywords = cs.filter(f => f.ID_ARTICLE === article.id_article)
            article.keywords = article.keywords.map(f => f = {
                id : f.ID_ARTICLE_KEYWORD,
                content : f.CONTENT
            })

            article.files = ft.filter(f => f.ID_ARTICLE === article.id_article)
            article.files = article.files.map(f => f = {
                id_file : f.ID_FILE,
                name : f.FILENAME,
                type : f.MIMETYPE,
                url : f.ORIGIN_URL,
                width : f.WIDTH,
                height : f.HEIGHT,
                color : f.COLOR
            })

            return article
        })

        return res.render('index', { articles : articles })
    },

    robots : async(req, res) => {
        res.header('Content-Type', 'text/plain; charset=utf-8')
        res.header('Content-Enconding', 'gzip');

        let robots = `User-agent: *\nDisallow:\nSitemap: ${PAGE_URL}/sitemap.xml`
        return res.send(robots).end()
    },

    renderArticles : async(req, res) => {
        let artg = await db.query(`
            SELECT
                ATG."ID_ARTICLE" as ID_ARTICLE,
                ATG."TITLE" as TITLE,
                ATG."CONTENT" as CONTENT,
                ATG."CREATED" as CREATED,
                ATG."UPDATED" as UPDATED,
                CT."ID_CATEGORY" as ID_CATEGORY, 
                CT."CONTENT" as CATEGORY_CONTENT
            FROM "ARTICLE" ATG
            INNER JOIN "ARTG_CATEGORY" CT ON CT."ID_CATEGORY" = ATG."ID_CATEGORY"
            WHERE ATG."ID_ARTICLE" = $1
        `, [req.article_id])

        if (artg[0]) {
            let article = makeArticleObj(artg[0])

            try {
                let qs = await db.query(`
                    SELECT
                        "ID_ARTICLE_KEYWORD",
                        "CONTENT"
                    FROM
                        "ARTICLE_KEYWORD"
                    WHERE
                        "ID_ARTICLE" = $1
                `, [article.id_article])

                qs.map(f => {
                    article.keywords.push({
                        id : f.ID_ARTICLE_KEYWORD,
                        content : f.CONTENT
                    })
                })

            } catch(err) {} 

            try {
                let qs = await db.query(`
                    SELECT 
                        F."ID_FILE",
                        F."FILENAME",
                        F."MIMETYPE",
                        F."ORIGIN_URL",
                        F."WIDTH",
                        F."HEIGHT",
                        F."COLOR"
                    FROM
                        "FILE" F
                    INNER JOIN "ARTICLE_FILE" FL ON FL."ID_ARTICLE" = $1 AND F."ID_FILE" = FL."ID_FILE"
                `, [article.id_article])

                qs.map(f => {
                    article.files.push({
                        id_file : f.ID_FILE,
                        name : f.FILENAME,
                        type : f.MIMETYPE,
                        url : f.ORIGIN_URL,
                        width : f.WIDTH,
                        height : f.HEIGHT,
                        color : f.COLOR
                    })
                })

            } catch (err) {}

            return res.render('article', { article : article })
        }

        return res.status(404).send('Not Found')
    }
}