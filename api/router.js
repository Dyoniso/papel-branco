const { app } = require('../app')

app.get('/', (req, res) => {
    return res.render('article')
})