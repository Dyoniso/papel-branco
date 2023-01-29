require('dotenv').config()
const { Configuration, OpenAIApi } = require("openai");
const Similarity = require('./utils/Similarity')

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
                console.log(error.response.status)
                console.log(error.response.data)
            } else {
                console.log(error.message)
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
            console.log(err)
            return []
        })
}

;(async() => {
    CategoriesObj = await makeCategoryList() 
    console.log(CategoriesObj)
    TitlesList = await makeTitleList()
    console.log(TitlesList)

    //makeArticleList()
    makeHistorysList()
})()

async function makeCategoryList() {
    let gptData = await generateText(gptCategoryQuery)
    let formatedData = gptData.choices[0].text.replace(/^[0-9]*\. /gm, '').split('\n').filter(f => f.length > 2)
    return { 
        gpt_id : gptData.id,
        contents : similarity.filterArrByRange(formatedData),
        created : gptData.created
    }
}

async function makeTitleList() {
    let arr = []
    for (let category of CategoriesObj.contents) {
        let gptData = await generateText(gptTitleQuery + ` categoria ${category}`)
        let formatedData = gptData.choices[0].text.replace(/^[0-9]*\. /gm, '').replace(/"/gm, '').split('\n').filter(f => f.length > 5)
        arr = arr.concat({ 
            gpt_id : gptData.id,
            category : category, 
            contents : similarity.filterArrByRange(formatedData, 0.6),
            created : gptData.created
        })
    }

    return arr
}

async function makeArticleList() {
    for(let obj of TitlesList) {
        for (let title of obj.contents) {
            let gptData = await generateText(gptArticleQuery + ` sobre ${title}`)
            let formatedData = gptData.choices[0].text

            let artcObj = {
                gpt_id : gptData.id,
                category : obj.category,
                title : title,
                content : formatedData,
                created : gptData.created
            }

            const files = await imageSearch(artcObj.title)
            artcObj.files = [files[0], files[1]]

            ArticlesList.push(artcObj)

            console.log(ArticlesList)
        }
    }
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

            console.log(hstObj)

            HistorysList.push(hstObj)
        }
    }
}


