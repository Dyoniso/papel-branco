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
                id_article : q.ID_ARTICLE,
                title : q.TITLE,
                content : q.CONTENT,
                created : q.CREATED,
                updated : q.UPDATED,
                id_category : q.ID_CATEGORY,
                category_content : q.CATEGORY_CONTENT
            }

            return res.render('article', article)
        }

        return res.status(404).send('Not Found')
    }
}