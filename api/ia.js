require('dotenv').config()
const { Configuration, OpenAIApi } = require("openai");
const Similarity = require('./utils/Similarity')
const logger = require('./utils/APILogger')
const { v4: uuidv4 } = require('uuid')
const db = require('./database/db')
const format = require('pg-format')
const ClearCharacters = require('./utils/ClearCharacters')
const clearCharacters = new ClearCharacters()
const axios = require('axios')
const fs = require('fs')

const router = require('./router')

const LOGTAG = 'ia.js'

const OPENAI_TOKEN = process.env.OPENAI_API_KEY
const BING_SUBSCRIPTION_KEY = process.env.BING_SUBSCRIPTION_KEY

const bingImgEndpoint = 'https://api.bing.microsoft.com/v7.0/images/search'

let QTD_ARTICLES =  process.env.QTD_ARTICLES
let QTD_KEYWORDS = process.env.QTD_KEYWORDS
let PRICIPAL_THEME = process.env.PRICIPAL_THEME
let SAVE_FILES = (process.env.ENABLE_SAVE_FILES === 'true' || process.env.ENABLE_SAVE_FILES === 'yes')
let ENABLE_SYNC = (process.env.ENABLE_SYNC === 'true' || process.env.ENABLE_SYNC === 'yes')

//Default Config
if (!PRICIPAL_THEME || PRICIPAL_THEME.length === 0)  PRICIPAL_THEME = ''
if (!QTD_ARTICLES || QTD_ARTICLES.length === 0) QTD_ARTICLES = 2
if (!QTD_KEYWORDS || QTD_KEYWORDS.length === 0) QTD_KEYWORDS = 5

const configuration = new Configuration({
    apiKey: OPENAI_TOKEN,
});
const openai = new OpenAIApi(configuration);

const similarity = new Similarity()

/* CHAT GPT QUERIES */
const gptWordlistQuery = `Liste-me ${QTD_ARTICLES} palavras ${ PRICIPAL_THEME.length > 0 ? `sobre ${PRICIPAL_THEME}` : ''} de modo aleatório`
const gptTitleQuery = 'Escreva-me um título de um artigo usando a palavra:' 
const gptArticleQuery = 'Escreva-me com detalhe um artigo envolvente, espirituoso que usa experiências pessoais e com alguns exemplos'
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
            logger.error('Error after get openai data: ' + { status : error.response.statusText, data : error.response.data }, LOGTAG)
        } else {
            logger.error('Error after get openai data: ' + error.message, LOGTAG)
        }
    })
}

// BEGIN SCRIPT
async function searchSaveFile(idArticle, query) {

    const params = {
        q: query,
        count: 2,
        offset: 0,
        mkt: 'en-US',
        safesearch: 'Moderate',
    }

    const headers = {
        'Ocp-Apim-Subscription-Key': BING_SUBSCRIPTION_KEY,
    }

    axios.get(bingImgEndpoint, { headers, params })
    .then(res => res = { res : res, data : res.data.value })
    .then(({res, data}) => {
        let contents = data.map(f => {
            return {
                gid : f.imageId,
                url : f.contentUrl,
                width : f.width,
                height : f.height,
                color : f.accentColor,
                mimetype : f.encodingFormat
            }
        })

        contents.map(async f => {
            axios({
                method : 'get',
                url : f.url,
                responseType: 'stream'
            }).then(async fres => {
                const filename = f.gid + '.' + f.mimetype

                if (SAVE_FILES) {
                    const file = fs.createWriteStream(`./public/assets/${filename}`)
                    fres.data.pipe(file)
                    file.on('finish', () => {
                        file.close()
                        logger.info('Novo arquivo adicionado no /assets/'+filename, LOGTAG)
                    })
                }
        
                try {
                    let qs = await db.query(`
                        INSERT INTO "FILE" (
                            "FILENAME",
                            "MIMETYPE",
                            "ORIGIN_URL",
                            "WIDTH",
                            "HEIGHT",
                            "COLOR"
                        ) VALUES (
                            $1, $2, $3, $4, $5, $6
                        ) RETURNING "ID_FILE";
                    `, [filename, f.mimetype, f.url, f.width, f.height, f.color])
        
                    if (qs[0] && qs[0].ID_FILE) {
                        let idFile = qs[0].ID_FILE
        
                        await db.query(`
                            INSERT INTO "ARTICLE_FILE" (
                                "ID_FILE", "ID_ARTICLE"
                            ) VALUES (
                                $1, $2
                            );
                        `, [idFile, idArticle])
                    }
        
                    logger.info('Novo arquivo salvo no banco de dados: '+filename, LOGTAG)
        
                } catch (err) {
                    logger.error('Erro ao gravar informações do arquivo no banco de dados.', LOGTAG)
                }
            })
            .catch(err => {
                logger.error('Erro na validação de imagens únicas. Err: ' + err.toString(), LOGTAG)
            })
        })
    })
    .catch(err => {
        logger.info('[Bing-IMG] Error na requisição de busca de imagens. ' + err.toString(), LOGTAG)
    })
}

async function makeWordRandomList() {
    logger.warning('Gerando novo conjunto de palavras de forma aleatória..', LOGTAG)

    let gptData = await generateText(gptWordlistQuery)
    if (gptData && gptData.choices[0]) {

        let formatedData = gptData.choices[0].text.replace(/^[0-9]*\. /gm, '').split('\n').filter(f => f.length > 2)
        formatedData = similarity.filterArrByRange(formatedData).map(f => {
            return { tm_id : uuidv4(), value : f}
        })

        let obj = { 
            gpt_id : gptData.id,
            contents : formatedData,
            created : gptData.created
        }

        logger.warning('Lista de palavras gerada com sucesso! Data: ' + JSON.stringify(obj), LOGTAG)

        return obj

    } else {
        logger.error('Nenhum tipo de palavra foi gerado', LOGTAG)
        return null
    }
}

async function generateArticleTitle(word) {
    logger.info('Gerando um novo título com base na palavra: ' + word)

    let gptData = await generateText(gptTitleQuery + ` ${word}`)

    if (gptData && gptData.choices[0]) {
        let formatedData = gptData.choices[0].text.replace(/\/n/gm, '').replace(/\"/gm, '')

        let obj = { 
            gpt_id : gptData.id,
            word : word,
            title : formatedData,
            created : gptData.created
        }

        logger.warning('Novo título gerado: ' + obj.title)

        return obj
    } else {
        logger.error('Não foi possivel gerar um título com a palavra: ' + word, LOGTAG)
        return null
    }
}

async function generateArticle(idCategory, title) {
    logger.warning('Iniciando a geração de um novo artigo com base no título: ' + title, LOGTAG)

    //Interval to prevents 429 error
    return new Promise(async(callback) => {
        setTimeout(async() => {
            let gptData = await generateText(gptArticleQuery + ` sobre ${title}`)

            if (gptData && gptData.choices[0]) {

                let formatedData = gptData.choices[0].text

                let artcObj = {
                    gpt_id : gptData.id,
                    page_path : generatePageUrl(title),
                    id_category : idCategory,
                    title : title,
                    content : formatedData,
                    created : gptData.created,
                }

                logger.warning('Artigo criado com sucesso!', LOGTAG)

                callback(artcObj)

            } else {
                logger.error('Não foi possível gerar o artigo. IA não conseguio encontrar um artigo sobre o título especifico. Título: ' + title, LOGTAG)
                callback(null)
            }

        }, 5000)
    })
}

let syncLock = false

exports.startOpenAiSync = async() => {

    //Lock sync
    if (syncLock || !ENABLE_SYNC) return
    syncLock = true

    let wordlist = await makeWordRandomList()

    if (wordlist) {
        // Fazer Comparação e Adicionar a Categoria
        let wordFmlData = []
        for (let w of wordlist.contents) {
            let qs = await db.query(`
                SELECT 1 as edit FROM "ARTG_CATEGORY"
                WHERE
                    levenshtein(lower("CONTENT"), lower($1)) <= 3
                LIMIT 1;
            `, [w])

            if (!qs[0] || qs[0].edit !== 1) {
                wordFmlData.push([w.value, wordlist.gpt_id, w.tm_id])
            } else {
                try {
                    db.query(`
                        UPDATE "ARTG_CATEGORY" SET
                            "QTD_MATCHED" = "QTD_MATCHED" + 1
                        WHERE
                            levenshtein(lower("CONTENT"), lower($1)) <= 3
                    `, [w.value])
                } catch (err) {
                    logger.error('Erro ao mudar status da categoria. Err: '+err.toString(), LOGTAG)
                }
            }

            if (wordFmlData.length > 0) {
                let qs = await db.query(format(`
                    INSERT INTO "ARTG_CATEGORY" (
                        "CONTENT", "GPT_ID", "API_ID"
                    ) VALUES %L RETURNING "API_ID", "ID_CATEGORY";
                `, wordFmlData))
                
                wordlist.contents.map(f => {
                    qs.map(q => {
                        if (q.API_ID === w.tm_id) {
                            return w.id_category = q.ID_CATEGORY
                        }
                    })
                })
            }
        }

        //Criar Artigo
        for (let w of wordlist.contents) {
            //Gerar Título
            const objT = await generateArticleTitle(w.value)

            if (objT) {
                const article = await generateArticle(w.id_category, objT.title)

                if (article) {
                    try {
                        let qs = await db.query(`
                            INSERT INTO "ARTICLE" (
                                "TITLE", "ID_CATEGORY", "GPT_ID", "CONTENT", "PAGE_PATH"
                            ) VALUES ($1, $2, $3, $4, $5) RETURNING "ID_ARTICLE"
                        `, [
                            article.title,
                            article.id_category,
                            article.gpt_id,
                            article.content,
                            article.page_path
                        ])
        
                        if (qs[0] && qs[0].ID_ARTICLE) {
                            let articleID = qs[0].ID_ARTICLE
                            let keywords = await generateKeywords(articleID, article.title)
        
                            if (keywords && keywords.length > 0) {
                                await searchSaveFile(articleID, keywords.join([separator = ' ']))
                            }
        
                            logger.info('[Articles] Novo artigo adicionado ao banco de dados. Data: ' + JSON.stringify(article), LOGTAG)
                        
                            await syncDBPagesMaping()
                        }
        
                    } catch (err) {
                        logger.error('Falha ao adicionar o artigo no banco de dados. Err: ' + err.toString(), LOGTAG)
                    }

                } else {
                    logger.error('Não foi possivel gerar um artigo com base no título: ' +objT.title)
                }
            }
        }
    }

    //Open Sync
    syncLock = false

}

exports.startOpenAiSync()

async function generateKeywords(idArticle, title) {
    logger.warning('Gerando palavras chaves do seguinte título: ' + title, LOGTAG)

    let gptData = await generateText(gptTagsQuery + ' ' + title)
    let formatedData = gptData.choices[0].text
    .toString()
    .replace(/^[0-9]*\. /gm, '')
    .split('\n')
    .filter(f => f.length > 2)

    if (formatedData.length > 0) {
        formatedData = formatedData.map(f => [idArticle, f.trim()])
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

function generatePageUrl(title) {
    function makeUrl(c) {
        c = clearCharacters.cleaup(c)
        
        return c.toString()
        .toLowerCase()
        .trim()
        .replace(/\/n/gm, '')
        .replace(/ /gm, '-')
        .replace(/["&\/\\#,$~{}?!:.´`]/gm, '') 
    }

    //Check url exists
    let url = makeUrl(title)
    let arr = router.getArtgRouters().filter(f => url === f.path)
    let num = arr.length
    if (num > 0) url = url + '-' + (num++)

    return url
}

async function syncDBPagesMaping() {
    let arr = router.getArtgRouters()
    let fmlRouters = arr.map(f => f.id)
    if (fmlRouters.length <= 0) fmlRouters = [-1]

    logger.warning('Iniciando mapeamento de rotas base em Artigos recem-criados', LOGTAG)

    let qs = await db.query(format(`
        SELECT "ID_ARTICLE", "PAGE_PATH" FROM "ARTICLE"
        WHERE "ID_ARTICLE" NOT IN (%L) ORDER BY "ID_ARTICLE" DESC
    `, fmlRouters))

    router.mapRoutes(qs)
    logger.warning('Mapeamento de rotas finalizado com sucesso', LOGTAG)
}
syncDBPagesMaping()