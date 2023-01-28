require('dotenv').config()
const { Configuration, OpenAIApi } = require("openai");
const Similarity = require('./api/utils/Similarity')

const OPENAI_TOKEN = process.env.OPENAI_API_KEY

const configuration = new Configuration({
    apiKey: OPENAI_TOKEN,
});
const openai = new OpenAIApi(configuration);

const similarity = new Similarity()

/* CHAT GPT QUERIES */
const gptCategoryQuery = 'Escreva uma lista de 2 categorias aleatórias'
const gptTitleQuery = 'Escreva uma lista de 2 títulos de artigos aleatórios'
const gptArticleQuery = 'Escreva com detalhes e emoção um artigo'

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

;(async() => {
    CategoriesObj = await makeCategoryList() 
    console.log(CategoriesObj)
    TitlesList = await makeTitleList()
    ArticlesObj = await makeArticleList()
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

    console.log(arr)

    return arr
}

async function makeArticleList() {
    let arr = []
    for(let obj of TitlesList) {
        for (let title of obj.contents) {
            let gptData = await generateText(gptArticleQuery + ` com o título ${title}`)
            let formatedData = gptData.choices[0].text
            arr.push({
                gpt_id : gptData.id,
                category : obj.category,
                title : title,
                content : formatedData,
                created : gptData.created
            })
        }
    }

    console.log(arr)
}


