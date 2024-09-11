import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

class LocalStorage {
  static initialized() async {
    prefs = await SharedPreferences.getInstance();
    print('Initialized Local Storage');
  }

  static checkLogin() async {
    bool? check = prefs.getBool('User Logined');
    if (check == true) {
      return true;
    } else {
      return true;
    }
  }
}
