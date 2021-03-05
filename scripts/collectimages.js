const fs = require('fs');
const path = require('path');
const puppeteer = require('puppeteer');
const parseDataURL = require("data-urls");
const fetch = require('node-fetch');
const uuid = require('uuid');
const csvParse = require('csv-parse/lib/sync');

(async () => {
    const input = fs.readFileSync('./糖質一覧データ表.csv', 'utf-8');
    const rows = csvParse(input, { columns: false })
        .map((row) => row[1])
        .filter((row) => row !== '');
    rows.splice(0, 1);

    const imagesPath = '/Users/tokahana/workspace/train/images/';
    for (const word of rows) {
        await fetchImages(word, imagesPath);
    }
})();

async function fetchImages(word, imagesPath) {
    const base64Word = Buffer.from(word).toString('base64').replace(/\+/g, '-').replace(/\//g, '_');
    const dirPath = path.join(imagesPath, base64Word);
    const dirExists = fs.existsSync(dirPath);
    console.log(`--- ${word} --- ${base64Word} --- ${dirExists}`);

    if (dirExists === false) {
        const browser = await puppeteer.launch({
            headless: true,
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

        fs.mkdirSync(dirPath)
        for (const url of imageURLs) {
            if (url.startsWith('data')) {
                const dataURL = parseDataURL(url);
                const ext = dataURL.mimeType.subtype;
                const data = dataURL.body;
                const file = `${uuid.v4()}.${ext}`;
                fs.writeFileSync(path.join(dirPath, file), data);
            } else if (url.startsWith('http')) {
                const res = await fetch(url);
                const ext = res.headers.get('Content-Type').split('/')[1];
                const data = await res.buffer();
                const file = `${uuid.v4()}.${ext}`;
                fs.writeFileSync(path.join(dirPath, file), data);
            }
        }
    }
}

async function sleep(ms) {
    await new Promise((resolve) => setTimeout(resolve, ms));
}