const logger = require("./utils/APILogger")
const LOG_TAG = 'manager.js'

module.exports = {
    renderArticles : (req, res) => {
        return res.render('article')
    }
}