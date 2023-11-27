import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE score(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    score INTEGER,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  static Future<sql.Database> db() async {
    if(kIsWeb){
      sql.databaseFactory = databaseFactoryFfiWeb;
    }else{
      sql.databaseFactory = databaseFactoryFfi;
    }
    final databasePath = await sql.getDatabasesPath();
    final path = join(databasePath, 'dino_run_db.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item
  static Future<int> createItem(String? name, int? score) async {
    final db = await DatabaseHelper.db();

    final data = {'name': name, 'score': score};
    final id = await db.insert('score', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseHelper.db();
    return db.rawQuery('''SELECT * from SCORE ORDER BY SCORE DESC''');
    //return db.query('score', orderBy: "score");
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String name, int? score) async {
    final db = await DatabaseHelper.db();

    final data = {
      'name': name,
      'description': score,
      'createdAt': DateTime.now().toString()
    };

    final result =
    await db.update('score', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await DatabaseHelper.db();
    try {
      await db.delete("score", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}