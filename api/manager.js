require('dotenv').config()
const logger = require("./utils/APILogger")
const db = require('./database/db')
const LOG_TAG = 'manager.js'

const PAGE_URL = process.env.SITE_URL

module.exports = {
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
            INNER JOIN "ARTICLE_FILE" FL ON FL."ID_ARTICLE" = ATG."ID_ARTICLE"
            INNER JOIN "FILE" F ON F."ID_FILE" = FL."ID_FILE"
            WHERE ATG."ID_ARTICLE" = $1
        `, [req.article_id])

        if (artg[0]) {
            let q = artg[0]

            let article = {
                id_article : q.id_article,
                title : q.title,
                content : q.content,
                created : q.created,
                updated : q.updated,
                id_category : q.id_category,
                category_content : q.category_content,
                files : [],
                keywords : []
            }

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

            console.log(article)

            return res.render('article', { article : article })
        }

        return res.status(404).send('Not Found')
    }
}