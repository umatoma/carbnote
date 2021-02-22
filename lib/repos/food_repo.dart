import 'dart:io';

import 'package:carbnote/models/food_model.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FoodRepo {
  static Future<void> copyDatabase() async {
    final dbsPath = await getDatabasesPath();
    final path = join(dbsPath, 'app.db');
    await deleteDatabase(path);
    final data = await rootBundle.load('assets/databases/app.db');
    final bytes = data.buffer.asUint8List(
      data.offsetInBytes,
      data.lengthInBytes,
    );
    await File(path).writeAsBytes(bytes, flush: true);
  }

  Database db;

  void dispose() {
    db?.close();
  }

  Future<Database> getDatabase() async {
    if (db == null) {
      final dbsPath = await getDatabasesPath();
      final path = join(dbsPath, 'app.db');
      db = await openDatabase(path);
    }
    return db;
  }

  Future<List<Food>> searchListByName(String name) async {
    final db = await getDatabase();
    final rows = await db.rawQuery(
      'SELECT * FROM foods where name LIKE ? ORDER BY name LIMIT 100',
      <String>['%$name%'],
    );
    final foods = rows.map((row) {
      return Food(
        id: row['id'] as int,
        no: row['no'] as int,
        name: row['name'] as String,
        carbGram: (row['carb_gram'] as double).toInt(),
      );
    }).toList();
    return foods;
  }
}
