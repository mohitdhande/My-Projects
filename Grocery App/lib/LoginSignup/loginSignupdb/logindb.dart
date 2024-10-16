import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class LoginDatabase {
  LoginDatabase._();

  static LoginDatabase loginClass = LoginDatabase._();
  Database? dbInstance;

  static final String TBname = "groceryloginSignup";
  static final String ColUsername = "dbuname";
  static final String ColPassword = "dbpass";

  Future<Database> getDBInstance() async {
    dbInstance ??= await openDB();
    return dbInstance!;
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "loginDB.db");
    return await openDatabase(dbPath, onCreate: (db, version) {
      ///create all your tables here
      db.execute("create table $TBname($ColUsername text,$ColPassword  text)");
    }, version: 1);
  }

  Future<bool> getInsert(
      {required String Username, required String Password}) async {
    var db = await getDBInstance();
    int check =
        await db.insert(TBname, {ColUsername: Username, ColPassword: Password});
    return check > 0;
  }

  Future<bool> getValidate({required String password}) async {
    var db = await getDBInstance();
    List<Map<String, dynamic>> result =
        await db.query(TBname, where: '$ColPassword=?', whereArgs: [password]);
    if (result.isEmpty) {
      return false;
    }
    return true;
  }
}
