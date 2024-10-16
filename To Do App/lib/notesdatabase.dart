import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Notesdatabase {
  Notesdatabase._();

  static final Notesdatabase ntDB = Notesdatabase._();

  static final String tableName = "notes";
  static final String colNameTitle = "title";
  static final String colNameDesc = "desc";
  static final String colNameSno = "sno";

  Database? notesDB;

  Future<Database> getDB() async {
    notesDB ??= await openDB();
    return notesDB!;
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "noteDB.db");
    return await openDatabase(dbPath, onCreate: (db, version) {
      ///create all your tables here
      db.execute(
          "create table $tableName($colNameSno integer primary key autoincrement,$colNameTitle  text,$colNameDesc  text)");
    }, version: 1);
  }

  Future<bool> addInsert({required String title, required String desc}) async {
    var db = await getDB();
    int check =
        await db.insert(tableName, {colNameTitle: title, colNameDesc: desc});
    return check > 0;
  }

  Future<List<Map<String, dynamic>>> getAllNotes() async {
    var db = await getDB();
    List<Map<String, dynamic>> allNotes = await db.query(tableName);
    return allNotes;
  }

  Future<bool> getUpdate({required String title, required String desc}) async {
    var db = await getDB();
    int check = await db.update(
        tableName, {colNameTitle: title, colNameDesc: desc},
        where: "$colNameTitle = ?", whereArgs: [title]);
    return check > 0;
  }

  Future<bool> getDelete({required String title}) async {
    var db = await getDB();
    int check = await db
        .delete(tableName, where: "$colNameTitle = ?", whereArgs: ['$title']);
    return check > 0;
  }
}
