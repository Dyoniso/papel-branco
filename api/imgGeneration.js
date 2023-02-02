const { Configuration, OpenAIApi } = require("openai")

const configuration = new Configuration({
    apiKey: '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',
});
const openai = new OpenAIApi(configuration);

;(async() => {
    const response = await openai.createImage({
        prompt: "Garfield's Best Movie Moments",
        n: 1,
        size: "512x512",
    });
    image_url = response.data.data[0].url;
})()
