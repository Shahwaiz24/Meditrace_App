import 'package:flutter/material.dart';

class SignUpViewmodel with ChangeNotifier {
  bool isCheck = false;
  bool isSignUpStart = false;
  bool isPasswordVisible = false;

  bool isSignUpError = false;
  bool isFocusPassword = false;
  bool isFocusEmail = false;
  bool isUiFieldsFill = false;
  bool isFocusName = false;
  bool isFocusPhoneNumber = false;
  bool isHiddenPassword = true;

  void onFocusChange(String field, bool hasFocus) {
    if (field == "fullName") {
      isFocusName = hasFocus;
      notifyListeners();
    } else if (field == "email") {
      isFocusEmail = hasFocus;
      notifyListeners();
    } else if (field == "phoneNumber") {
      isFocusPhoneNumber = hasFocus;
      notifyListeners();
    } else if (field == "password") {
      isFocusPassword = hasFocus;
      notifyListeners();
    }
    notifyListeners();
  }

  checkBoxHit() {
    isCheck = !isCheck;
    notifyListeners();
  }

  hiddenText() {
    isHiddenPassword = !isHiddenPassword;
    notifyListeners();
  }

  void onPasswordFocusChange(bool hasFocus) {
    isFocusPassword = hasFocus;

    notifyListeners();
  }

  onChanged({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      isPasswordVisible = false;
      isSignUpError = false;
      notifyListeners();
    } else {
      isPasswordVisible = true;

      isSignUpError = false;

      notifyListeners();
    }
  }

  void onEmailFocusChange(bool hasFocus) {
    isFocusEmail = hasFocus;

    notifyListeners();
  }

  void onNameFocusChange(bool hasFocus) {
    isFocusName = hasFocus;

    notifyListeners();
  }

  void onPhoneNumberFocusChange(bool hasFocus) {
    isFocusPhoneNumber = hasFocus;

    notifyListeners();
  }
}
