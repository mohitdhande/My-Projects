import 'package:flutter/material.dart';
import 'package:todoproviderdb_1/loginsignupdatabse.dart';
//import 'package:providerlogin_0/loginsignupdatabse.dart';

class Loginpro extends ChangeNotifier {
  LoginSignupDatabse lsDB = LoginSignupDatabse.lsDB;

  Future<bool> proInsert(
      {required String username, required String password}) async {
    bool insertCheck =
        await lsDB.getInsert(Username: username, Password: password);
    if (insertCheck) {
      notifyListeners();
    }
    return insertCheck;
  }

  Future<bool> proValidate({required String password}) async {
    bool check = await lsDB.getValidate(password: password);
    if (check) {
      notifyListeners();
    }
    return check;
  }
}
