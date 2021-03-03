import 'dart:io';

import 'package:carbnote/models/menu_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<List<Menu>> searchListByNames(List<String> names) async {
    final db = await getDatabase();
    final searchNames = names.map((name) => name.kanaToHira()).toList();
    final rows = await db.query(
      'menus',
      where: searchNames.map((_) => 'search_name LIKE ?').join(' OR '),
      whereArgs: searchNames.map((name) => '%$name%').toList(),
      orderBy: 'name',
      limit: 100,
    );
    final menus = rows.map((row) {
      return Menu(
        id: (row['id'] as int).toString(),
        category: row['category'] as String,
        name: row['name'] as String,
        unit: row['unit'] as String,
        carbGramPerUnit: row['carb_gram_per_unit'] as double,
      );
    }).toList();
    return menus;
  }
}

class MyMenuRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Menu> getOne(String id, String userID) async {
    final doc = await firestore
        .collection('users')
        .doc(userID)
        .collection('menus')
        .doc(id)
        .get();
    return docToMenu(doc);
  }

  Stream<List<Menu>> getList(String userID) {
    return firestore
        .collection('users')
        .doc(userID)
        .collection('menus')
        .orderBy('name')
        .snapshots()
        .map((query) => query.docs.map((doc) => docToMenu(doc)).toList());
  }

  Future<Menu> create(Menu value) async {
    final ref = firestore
        .collection('users')
        .doc(value.userID)
        .collection('menus')
        .doc();
    await ref.set(menuToData(value.copyWith(
      id: ref.id,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    )));
    return await getOne(ref.id, value.userID);
  }

  Future<Menu> update(Menu value) async {
    final ref = firestore
        .collection('users')
        .doc(value.userID)
        .collection('menus')
        .doc(value.id);
    await ref.update(menuToData(value.copyWith(
      updatedAt: DateTime.now(),
    )));
    return await getOne(ref.id, value.userID);
  }

  Future<void> delete(Menu value) async {
    final ref = firestore
        .collection('users')
        .doc(value.userID)
        .collection('menus')
        .doc(value.id);
    await ref.delete();
  }

  Menu docToMenu(DocumentSnapshot doc) {
    return Menu(
      id: doc.id,
      userID: doc['userID'] as String,
      name: doc['name'] as String,
      imageURL: doc['imageURL'] as String,
      unit: doc['unit'] as String,
      carbGramPerUnit: doc['carbGramPerUnit'] as double,
    );
  }

  Map<String, dynamic> menuToData(Menu value) {
    return <String, dynamic>{
      'id': value.id,
      'userID': value.userID,
      'name': value.name,
      'imageURL': value.imageURL,
      'unit': value.unit,
      'carbGramPerUnit': value.carbGramPerUnit,
      'updatedAt': Timestamp.fromDate(value.updatedAt),
      'createdAt': Timestamp.fromDate(value.createdAt),
    };
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
