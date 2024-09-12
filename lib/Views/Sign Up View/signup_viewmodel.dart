import 'package:flutter/material.dart';

class SignUpViewmodel with ChangeNotifier {
  bool isCheck = false;

  checkBoxHit() {
    isCheck = !isCheck;
    notifyListeners();
  }
}
