import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

class LocalStorage {
  static initialized() async {
    prefs = await SharedPreferences.getInstance();
    print('Initialized Local Storage');
  }

  static checkLogin() async {
    bool? check = await prefs.getBool('User Logined');

    print("Check Login : ${check}");
    if (check == true) {
      return true;
    } else {
      return false;
    }
  }

  static userLogin() async {
    await prefs.setBool('User Logined', true);
  }

  static saveUserId({required String userId}) async {
    print("Saving User ID: $userId");
    await prefs.setString("User_Id", userId);
  }

  static getUserid() async {
    String? getId = prefs.getString("User_Id"); // No need for await here
    print("User ID Retrieved: $getId");

    if (getId != null && getId.isNotEmpty) {
      return getId;
    } else {
      print("User ID is null or empty.");
      return null;
    }
  }

  static logoutUser() {
    prefs.clear();
  }
}
