const fs = require('fs');
const path = require('path');
const puppeteer = require('puppeteer');
const parseDataURL = require("data-urls");
const fetch = require('node-fetch');
const uuid = require('uuid');

(async () => {
    const imagesPath = '/Users/tokahana/workspace/train/images/';
    const words = [
        'おにぎり',
        'パン',
        'シリアル',
        'カレー',
        'りんご',
    ];
    for (const word of words) {
        await fetchImages(word, imagesPath);
    }
})();

async function fetchImages(word, imagesPath) {
    const browser = await puppeteer.launch({
        headless: false,
        defaultViewport: {
            width: 1920,
            height: 1080,
        },
    });
    const page = await browser.newPage();
    await page.goto(`https://www.google.com/search?q=${encodeURIComponent(word)}&tbm=isch`);
    await sleep(1000);
    const elements = await page.$$('#islmp img');
    const imageURLs = [];
    for (const elem of elements) {
        const src = await (await elem.getProperty('src')).jsonValue();
        imageURLs.push(src);
    }
    await browser.close();

    const dirPath = path.join(imagesPath, Buffer.from(word).toString('base64'));
    fs.mkdirSync(dirPath)
    for (const url of imageURLs) {
        if (url.startsWith('data')) {
            const dataURL = parseDataURL(url);
            const ext = dataURL.mimeType.subtype;
            const data = dataURL.body;
            const file = `${uuid.v4()}.${ext}`;
            fs.writeFileSync(path.join(dirPath, file), data);
            console.log(file);
        } else if (url.startsWith('http')) {
            const res = await fetch(url);
            const ext = res.headers.get('Content-Type').split('/')[1];
            const data = await res.buffer();
            const file = `${uuid.v4()}.${ext}`;
            fs.writeFileSync(path.join(dirPath, file), data);
            console.log(file);
        }
    }
}

async function sleep(ms) {
    await new Promise((resolve) => setTimeout(resolve, ms));
}