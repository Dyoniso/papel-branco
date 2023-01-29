require('dotenv').config()
const { Configuration, OpenAIApi } = require("openai");
const Similarity = require('./utils/Similarity')
const logger = require('./utils/APILogger')

const LOGTAG = 'ia.js'

const google = require('googlethis')

const OPENAI_TOKEN = process.env.OPENAI_API_KEY

const configuration = new Configuration({
    apiKey: OPENAI_TOKEN,
});
const openai = new OpenAIApi(configuration);

const similarity = new Similarity()

/* CHAT GPT QUERIES */
const gptCategoryQuery = 'Escreva uma lista de 2 categorias de terror aleatórias'
const gptTitleQuery = 'Escreva uma lista de 2 títulos de artigos aleatórios'
const gptArticleQuery = 'Escreva com detalhes e emoção um artigo'
const gptHistorysQuery = 'Escreva com detalhes e emoção uma história'

async function generateText(ask) {
    return await openai.createCompletion({
        model: 'text-davinci-003',
        prompt: ask,
        max_tokens: 2048,
        n: 1,
        temperature: 0.5,
        presence_penalty: 2
    })
        .then((res) => res.data)
        .catch((error) => {
            if (error.response) {
                logger.error('Error after get openai data: ' + { status : error.response.status, data : error.response.data }, LOGTAG)
            } else {
                logger.error('Error after get openai data: ' + error.message, LOGTAG)
            }
        })
}

// BEGIN SCRIPT
let CategoriesObj = {}
let TitlesList = []
let ArticlesList = []
let HistorysList = []

async function imageSearch(content) {
    const options = {
        page : 0,
        safe : false,
        parse_ads : false,
    }

    return await google.image(`${content}`, options)
        .then(data => data.map(f => {
            return {
                gid : f.id,
                url : f.url,
                width : f.width,
                height : f.height,
                color : f.color
            }
        }))
        .catch((err) => {
            logger.info('[Google-IMG] Error ao procurar imagens. ' + err.toString(), LOGTAG)
            return []
        })
}

async function makeCategoryList() {
    logger.info('Iniciando sicronização da lista de categoria..')

    let gptData = await generateText(gptCategoryQuery)
    let formatedData = gptData.choices[0].text.replace(/^[0-9]*\. /gm, '').split('\n').filter(f => f.length > 2)
    let obj = { 
        gpt_id : gptData.id,
        contents : similarity.filterArrByRange(formatedData),
        created : gptData.created
    }

    logger.info('Sicronização da lista de categoria finalizada com sucesso! data: ' + JSON.stringify(obj), LOGTAG)
    CategoriesObj = obj
}

async function makeTitleList() {
    logger.info('Iniciando sicronização de títulos dos artigos..')

    for (let category of CategoriesObj.contents) {
        let gptData = await generateText(gptTitleQuery + ` categoria ${category}`)
        let formatedData = gptData.choices[0].text.replace(/^[0-9]*\. /gm, '').replace(/"/gm, '').split('\n').filter(f => f.length > 5)
        let obj = { 
            gpt_id : gptData.id,
            category : category, 
            contents : similarity.filterArrByRange(formatedData, 0.6),
            created : gptData.created
        }

        TitlesList.push(obj)

        logger.info('[Article-Title] Novo objeto adicionado a lista: ' + JSON.stringify(obj), LOGTAG)
    }

    logger.info('Os títulos dos artigos foram sicronizados com sucesso!')
}

async function makeArticleList() {
    logger.info('Iniciando sicronização de Artigos com base em títulos do [Article-Titles]', LOGTAG)

    for(let obj of TitlesList) {
        for (let title of obj.contents) {
            let gptData = await generateText(gptArticleQuery + ` sobre ${title}`)
            let formatedData = gptData.choices[0].text

            let artcObj = {
                gpt_id : gptData.id,
                category : obj.category,
                page_path : generatePageUrl(title),
                title : title,
                content : formatedData,
                created : gptData.created,
            }

            const files = await imageSearch(artcObj.title)
            artcObj.files = [files[0], files[1]]

            ArticlesList.push(artcObj)

            logger.info('[Articles] Novo objeto adicionado a lista. data: ' + JSON.stringify(artcObj), LOGTAG)
        }
    }

    logger.info('Os Artigos foram sicronizados com sucesso!', LOGTAG)
}

async function makeHistorysList() {
    for(let obj of TitlesList) {
        for (let title of obj.contents) {
            let gptData = await generateText(gptHistorysQuery + ` sobre ${title}`)
            let formatedData = gptData.choices[0].text

            let hstObj = {
                gpt_id : gptData.id,
                category : obj.category,
                title : title,
                content : formatedData,
                created : gptData.created
            }

            const files = await imageSearch(hstObj.title)
            hstObj.files = [files[0], files[1]]

            HistorysList.push(hstObj)
        }
    }
}

function generatePageUrl(title) {
    function makeUrl(c) {
        return c.toString()
        .toLowerCase()
        .replace(/ /g, '-')
        .replace(/[&\/\\#,$~{}?!:.]/g, '') 
    }

    //Check url exists
    let url = makeUrl(title)
    let arr = TitlesList.filter(f => makeUrl(f) === url)
    let num = arr.length
    if (num > 0) url = url + '-' + (num++)

    return url
}

exports.startSync = async(callback) => {
    await makeCategoryList() 
    await makeTitleList()
    await makeArticleList()
    //makeHistorysList()

    return callback
}



