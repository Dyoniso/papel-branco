const logger = require("./utils/APILogger")
const db = require('./database/db')
const LOG_TAG = 'manager.js'

module.exports = {
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
            let q = artg[0]

            let article = {
                id_article : q.id_article,
                title : q.title,
                content : q.content,
                created : q.created,
                updated : q.updated,
                id_category : q.id_category,
                category_content : q.category_content
            }

            return res.render('article', { article : article })
        }

        return res.status(404).send('Not Found')
    }
}