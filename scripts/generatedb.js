const path = require('path');
const fs = require('fs');
const csvParse = require('csv-parse/lib/sync');
const sqlite3 = require('sqlite3');

const input = fs.readFileSync('./20201225-mxt_kagsei-mext_01110_012.csv', 'utf-8');
const rows = csvParse(input, { columns: false }).map((row) => ({
    no: row[1],
    id: row[2],
    name: row[3]
        .replace(/＜.+＞　/g, '')
        .replace(/［/g, '[')
        .replace(/］/g, ']')
        .replace(/（/g, '(')
        .replace(/）/g, ')')
        .replace(/　/g, ' '),
    carbGram: ((carbGram) => {
        if (carbGram === '-') return parseFloat(
            row[16].replace('(', '').replace(')', '')
        );
        if (carbGram === 'Tr') return 0.0;
        if (carbGram === '(Tr)') return 0.0;
        return parseFloat(
            carbGram.replace('(', '').replace(')', '')
        );
    })(row[13]),
})).filter((row) => !isNaN(row.carbGram));

const db = new sqlite3.Database(path.resolve(
    __dirname,
    '../assets/databases/app.db',
));
db.serialize(() => {
    db.run('DROP TABLE IF EXISTS foods;');
    db.run(
        'CREATE TABLE foods (' +
        '  id INTEGER PRIMARY KEY,' +
        '  no INTEGER NOT NULL,' +
        '  name STRING NOT NULL,' +
        '  carb_gram REAL NOT NULL' +
        ');',
    );
    for (const row of rows) {
        db.run(
            'INSERT INTO foods (id, no, name, carb_gram) VALUES (?, ?, ?, ?)',
            row.id,
            row.no,
            row.name,
            row.carbGram,
        );
    }
});
db.close();
