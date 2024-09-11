import 'package:flutter/material.dart';

class SigninViewmodel with ChangeNotifier {
  bool isFocused = false; // Focus state track karne ke liye
  void onFieldFocusChange(bool hasFocus) {
    isFocused = hasFocus;
 
    notifyListeners();
  }
}
