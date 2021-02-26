const path = require('path');
const fs = require('fs');
const csvParse = require('csv-parse/lib/sync');
const sqlite3 = require('sqlite3');

// const input = fs.readFileSync('./20201225-mxt_kagsei-mext_01110_012.csv', 'utf-8');
const input = fs.readFileSync('./糖質一覧データ表.csv', 'utf-8');
const rows = csvParse(input, { columns: false }).map((row) => ({
    category: row[0],
    name: row[1],
    unit: row[2],
    carbGram: parseFloat(row[3]),
})).filter((row) => row.category !== '');
rows.splice(0, 1);

for (const row of rows) {
    console.log(row.category, row.name, row.unit, row.carbGram);
}

const db = new sqlite3.Database(path.resolve(
    __dirname,
    '../assets/databases/app.db',
));
db.serialize(() => {
    db.run('DROP TABLE IF EXISTS menus;');
    db.run(
        'CREATE TABLE menus (' +
        '  id INTEGER PRIMARY KEY AUTOINCREMENT,' +
        '  category STRING NOT NULL,' +
        '  name STRING NOT NULL,' +
        '  unit STRING NOT NULL,' +
        '  carb_gram_per_unit REAL NOT NULL' +
        ');',
    );
    for (const row of rows) {
        db.run(
            'INSERT INTO menus (category, name, unit, carb_gram_per_unit) ' +
            'VALUES (?, ?, ?, ?)',
            row.category,
            row.name,
            row.unit,
            row.carbGram,
        );
    }
});
db.close();
