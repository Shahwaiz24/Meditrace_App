import 'package:flutter/material.dart';

class SigninViewmodel with ChangeNotifier {
  bool isPasswordVisible = false;
  bool isHiddenPassword = true;
  bool isFocusEmail = false; // Focus state track karne ke liye
  void onEmailFocusChange(bool hasFocus) {
    isFocusEmail = hasFocus;

    notifyListeners();
  }

  hiddenText() {
    isHiddenPassword = !isHiddenPassword;
    notifyListeners();
  }

  onChanged({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      isPasswordVisible = false;
      notifyListeners();
    } else {
      isPasswordVisible = true;
      notifyListeners();
    }
  }

  bool isFocusPassword = false; // Focus state track karne ke liye
  void onPasswordFocusChange(bool hasFocus) {
    isFocusPassword = hasFocus;

    notifyListeners();
  }
}
