import 'dart:io';

import 'package:carbnote/models/menu_model.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MenuRepo {
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

  Future<List<Menu>> searchListByName(String name) async {
    final db = await getDatabase();
    final searchName = name.kanaToHira();
    final rows = await db.rawQuery(
      'SELECT * FROM menus where search_name LIKE ? ORDER BY name LIMIT 100',
      <String>['%$searchName%'],
    );
    final foods = rows.map((row) {
      return Menu(
        id: row['id'] as int,
        category: row['category'] as String,
        name: row['name'] as String,
        unit: row['unit'] as String,
        carbGramPerUnit: row['carb_gram_per_unit'] as double,
      );
    }).toList();
    return foods;
  }
}

extension ExString on String {
  String kanaToHira() {
    return replaceAllMapped(
      RegExp('[\u30a1-\u30f6]'),
      (match) => String.fromCharCode(match.group(0).codeUnitAt(0) - 0x60),
    );
  }
}
