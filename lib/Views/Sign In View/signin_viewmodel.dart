import 'package:flutter/material.dart';

class SigninViewmodel with ChangeNotifier {
  bool isFocusEmail = false; // Focus state track karne ke liye
  void onEmailFocusChange(bool hasFocus) {
    isFocusEmail = hasFocus;
 
    notifyListeners();
  }
    bool isFocusPassword = false; // Focus state track karne ke liye
  void onPasswordFocusChange(bool hasFocus) {
    isFocusPassword = hasFocus;

    notifyListeners();
  }
}
