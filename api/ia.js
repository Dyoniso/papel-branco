require('dotenv').config()
const { Configuration, OpenAIApi } = require("openai");
const Similarity = require('./utils/Similarity')
const logger = require('./utils/APILogger')
const { v4: uuidv4 } = require('uuid')
const db = require('./database/db')
const format = require('pg-format')
const ClearCharacters = require('./utils/ClearCharacters')
const clearCharacters = new ClearCharacters()
const http = require('http')
const fs = require('fs')

const router = require('./router')

const LOGTAG = 'ia.js'

const google = require('googlethis')

const OPENAI_TOKEN = process.env.OPENAI_API_KEY
let QTD_CATEGORY = process.env.QTD_CATEGORY
let QTD_ARTICLES =  process.env.QTD_CATEGORY
let QTD_KEYWORDS = process.env.QTD_KEYWORDS
let PRICIPAL_THEME = process.env.PRICIPAL_THEME

//Default Config
if (!PRICIPAL_THEME || PRICIPAL_THEME.length === 0)  PRICIPAL_THEME = ''
if (!QTD_ARTICLES || QTD_ARTICLES.length === 0) QTD_ARTICLES = 2
if (!QTD_CATEGORY || QTD_CATEGORY.length === 0) QTD_CATEGORY = 5
if (!QTD_KEYWORDS || QTD_KEYWORDS.length === 0) QTD_KEYWORDS = 5

const configuration = new Configuration({
    apiKey: OPENAI_TOKEN,
});
const openai = new OpenAIApi(configuration);

const similarity = new Similarity()

/* CHAT GPT QUERIES */
const gptCategoryQuery = `Liste-me nomes de ${QTD_CATEGORY} categorias ${PRICIPAL_THEME} de modo aleatório`
const gptTitleQuery = `Liste-me em Português ${QTD_ARTICLES} títulos de artigo de modo aleatório`
const gptArticleQuery = 'Escreva-me com detalhe um artigo envolvente, espirituoso que usa experiências pessoais e com alguns exemplos'
const gptHistorysQuery = 'Escreva com detalhes e emoção uma história'
const gptTagsQuery = `Liste-me em inglês ${QTD_KEYWORDS} palavras-chave do seguinte texto:`

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
async function imageSearch(content) {
    const options = {
        page : 0,
        safe : false,
        parse_ads : false,
    }

    return await google.image(`${content} filetype: jpg,jpeg,webp`, options)
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

;(async() => {
    const content = await imageSearch('Cat')
    let files = [content[0], content[1]]
    console.log(files)
})()

async function makeCategoryList() {
    logger.warning('Iniciando sicronização da lista de categoria..')

    let gptData = await generateText(gptCategoryQuery)
    let formatedData = gptData.choices[0].text.replace(/^[0-9]*\. /gm, '').split('\n').filter(f => f.length > 2)

    let ctlFormated = []
    for (let f of similarity.filterArrByRange(formatedData)) {
        ctlFormated.push({ tm_id : uuidv4(), value : f})
    }

    let obj = { 
        gpt_id : gptData.id,
        contents : ctlFormated,
        created : gptData.created
    }

    logger.warning('Sicronização da lista de categoria finalizada com sucesso! data: ' + JSON.stringify(obj), LOGTAG)
    return obj
}

async function makeTitleList(CategoriesObj) {
    logger.warning('Iniciando sicronização de títulos dos artigos..')

    let arr = []

    for (let category of CategoriesObj.contents) {
        let gptData = await generateText(gptTitleQuery + ` com a categoria ${category.value}`)
        let formatedData = gptData.choices[0].text.replace(/^[0-9]*\. /gm, '').replace(/"/gm, '').split('\n').filter(f => f.length > 5)
        let obj = { 
            gpt_id : gptData.id,
            category_id : category.id_category, 
            contents : similarity.filterArrByRange(formatedData, 0.6),
            created : gptData.created
        }

        arr.push(obj)

        logger.info('[Article-Title] Novo objeto adicionado a lista: ' + JSON.stringify(obj), LOGTAG)
    }

    logger.warning('Os títulos dos artigos foram sicronizados com sucesso!')

    return arr
}

async function generateKeywords(idArticle, title) {
    logger.warning('Gerando palavras chaves do seguinte título: ' + title, LOGTAG)

    let gptData = await generateText(gptTagsQuery + ' ' + title)
    let formatedData = gptData.choices[0].text
    .toString()
    .trim()
    .replace(/^[0-9]*\. /gm, '')
    .split('\n')
    .filter(f => f.length > 2)

    if (formatedData.length > 0) {
        formatedData = formatedData.map(f => [idArticle, f])
        try {
            await db.query(format(`
                INSERT INTO "ARTICLE_KEYWORD" (
                    "ID_ARTICLE",
                    "CONTENT"
                ) VALUES %L
            `, formatedData))
        } catch (err) {
            logger.error('Error ao gravar palavras chaves no banco de dados: ' + err.toString(), LOGTAG)
        }

        logger.warning('Palavras chaves geradas com sucesso. Data: ' + JSON.stringify(formatedData), LOGTAG)

        return formatedData.map(f => f[1])
    }

    return []
}

async function generateArticles(TitlesList) {
    logger.warning('Iniciando sicronização de Artigos com base em títulos do [Article-Titles]', LOGTAG)

    for(let obj of TitlesList) {
        for (let title of obj.contents) {
            let gptData = await generateText(gptArticleQuery + ` sobre ${title}`)
            let formatedData = gptData.choices[0].text

            let artcObj = {
                gpt_id : gptData.id,
                category_id : obj.category_id,
                page_path : generatePageUrl(TitlesList, title),
                title : title,
                content : formatedData,
                created : gptData.created,
            }

            try {
                let qs = await db.query(`
                    INSERT INTO "ARTICLE" (
                        "TITLE", "ID_CATEGORY", "GPT_ID", "CONTENT", "PAGE_PATH"
                    ) VALUES ($1, $2, $3, $4, $5) RETURNING "ID_ARTICLE"
                `, [
                    artcObj.title,
                    artcObj.category_id,
                    artcObj.gpt_id,
                    artcObj.content,
                    artcObj.page_path
                ])

                if (qs[0] && qs[0].ID_ARTICLE) {
                    let articleID = qs[0].ID_ARTICLE
                    let keywords = await generateKeywords(articleID, title)

                    if (keywords && keywords.length > 0) {
                        const files = await imageSearch(keywords.join([separator = ' ']))
                        artcObj.files = [files[0], files[1]]



                        console.log(artcObj.files)
                    }

                    logger.info('[Articles] Novo objeto adicionado ao banco de dados. data: ' + JSON.stringify(artcObj), LOGTAG)
                
                    syncDBPagesMaping()
                }

            } catch (err) {
                logger.error('Falha ao gerar Artigo, verifique o IA GPT. Err: ' + err.toString(), LOGTAG)
            }
        }
    }

    logger.warning('Os Artigos foram sicronizados com sucesso!', LOGTAG)
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

function generatePageUrl(TitlesList, title) {
    function makeUrl(c) {
        c = clearCharacters.cleaup(c)
        
        return c.toString()
        .toLowerCase()
        .trim()
        .replace(/ /gm, '-')
        .replace(/[&\/\\#,$~{}?!:.´`]/gm, '') 
    }

    //Check url exists
    let url = makeUrl(title)
    let arr = TitlesList.filter(f => makeUrl(f) === url)
    let num = arr.length
    if (num > 0) url = url + '-' + (num++)

    return url
}

let syncLock = false

exports.startSync = async(fromDatabase) => {

    return

    //Lock sync
    if (syncLock) return
    syncLock = true

    let categories = {}
    //let articles = await makeArticleList(titles)
    //makeHistorysList()

    try {
        if (!fromDatabase) {

            categories = await makeCategoryList()
            let categoryFmlData = []

            for (let f of categories.contents) {
                try {
                    let qs = await db.query(`
                        SELECT 1 as edit FROM "ARTG_CATEGORY"
                        WHERE
                            levenshtein(lower("CONTENT"), lower($1)) <= 3
                        LIMIT 1;
                    `, [f.value])

                    if (!qs[0] || qs[0].edit !== 1) {
                        categoryFmlData.push([f.value, categories.gpt_id, f.tm_id])
                    } else {
                        try {
                            db.query(`
                                UPDATE "ARTG_CATEGORY" SET
                                    "QTD_MATCHED" = "QTD_MATCHED" + 1
                                WHERE
                                    levenshtein(lower("CONTENT"), lower($1)) <= 3
                            `, [f.value])
                        } catch (err) {
                            logger.error('Erro ao mudar status da categoria. Err: '+err.toString(), LOGTAG)
                        }
                    }
                } catch (err) {
                    logger.error('Error na validação de categorias. Err: ' + err.toString(), LOGTAG)
                }
            }

            if (categoryFmlData.length > 0) {
                let qs = await db.query(format(`
                    INSERT INTO "ARTG_CATEGORY" (
                        "CONTENT", "GPT_ID", "API_ID"
                    ) VALUES %L RETURNING "API_ID", "ID_CATEGORY";
                `, categoryFmlData))
                
                categories.contents = categories.contents.filter(f => {
                    for (let q of qs) {
                        if (q.API_ID === f.tm_id) {
                            f.id_category = q.ID_CATEGORY
                            return f
                        }
                    }
                })

                logger.info('Novo conjunto de categorias adicionada ao banco de dados. Data: ' + JSON.stringify(categoryFmlData), LOGTAG)
            }

        } else {

            // Select random category
            let qs = await db.query(`
                SELECT 
                    "ID_CATEGORY",
                    "CONTENT",
                    "GPT_ID",
                    "API_ID"
                FROM
                    "ARTG_CATEGORY"
                ORDER BY random()
                LIMIT $1
            `, [QTD_CATEGORY])
            
            let fmlCategory = []
            let obj = {}
            let contents = qs.map(f => {
                if (!obj.gpt_id) obj.gpt_id = f.GPT_ID

                fmlCategory.push(f.ID_CATEGORY)

                return {
                    id_category : f.ID_CATEGORY, tm_id : f.API_ID, value : f.CONTENT
                }
            })
            obj.contents = contents

            logger.warning('Novo conjunto de categorias selecionado para a sicronização. Data: ' + JSON.stringify(contents), LOGTAG)

            try {
                db.query(format(`
                    UPDATE "ARTG_CATEGORY" SET
                        "QTD_SYNC" = "QTD_SYNC" + 1
                    WHERE
                        "ID_CATEGORY" IN (%L) 
                `, fmlCategory))

            } catch (err) {
                logger.error('Error após gravar status de categoria. Err: '+err.toString(), LOGTAG)
            }

            categories = obj
        }

    } catch (err) {
        logger.error('Error na sicronização de categorias com o banco de dados. Err: ' + err.toString(), LOGTAG)
    }

    let titles = await makeTitleList(categories)

    try {
        for (let f of titles) {
            f.contents = await f.contents.filter(async c => {
                try {
                    let qs = await db.query(`
                        SELECT 1 as edit FROM "ARTICLE"
                        WHERE
                            levenshtein(lower("TITLE"), lower($1)) <= 3
                        LIMIT 1;
                    `, [c])

                    if (!qs[0] || qs[0].edit !== 1) return c

                } catch (err) {
                    logger.error('Erro na validação de títulos. Err: ' + err.toString(), LOGTAG)
                }
            })
        }

        await generateArticles(titles)

    } catch (err) {
        logger.error('Erro sicronização de artigos com o banco de dados. Err: ' + err.toString(), LOGTAG)
    }
    
    //Open sync to new entries
    syncLock = false
}

async function syncDBPagesMaping() {
    let arr = router.getArtgRouters()
    let fmlRouters = arr.map(f => f.id)
    if (fmlRouters.length <= 0) fmlRouters = [-1]

    logger.warning('Iniciando mapeamento de rotas base em Artigos recem-criados', LOGTAG)

    let qs = await db.query(format(`
        SELECT "ID_ARTICLE", "PAGE_PATH" FROM "ARTICLE"
        WHERE "ID_ARTICLE" NOT IN (%L)
    `, fmlRouters))

    router.mapRoutes(qs)
    logger.warning('Mapeamento de rotas finalizado com sucesso', LOGTAG)
}
syncDBPagesMaping()