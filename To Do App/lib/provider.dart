import 'package:flutter/material.dart';
import 'package:todoproviderdb_1/notesdatabase.dart';

class ProviderDB extends ChangeNotifier {
  Notesdatabase ntDB = Notesdatabase.ntDB;

  List<Map<String, dynamic>> allNotes = [];

  Future<bool> providerAdd(
      {required String title, required String desc}) async {
    bool check = await ntDB.addInsert(title: title, desc: desc);
    if (check) {
      allNotes = await ntDB.getAllNotes();
      notifyListeners();
    }
    return check;
  }

  List<Map<String, dynamic>> getAllNotes() => allNotes;

  void getPreviousNotes() async {
    allNotes = await ntDB.getAllNotes();
    notifyListeners();
  }

  Future<bool> providerUpdate(
      {required String title, required String desc}) async {
    bool check = await ntDB.getUpdate(title: title, desc: desc);
    if (check) {
      allNotes = await ntDB.getAllNotes();
      notifyListeners();
    }
    return check;
  }

  Future<bool> providerDelete({required String title}) async {
    bool check = await ntDB.getDelete(title: title);
    if (check) {
      allNotes = await ntDB.getAllNotes();
      notifyListeners();
    }
    return check;
  }
}
