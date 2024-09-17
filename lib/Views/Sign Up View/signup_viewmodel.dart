import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_Data.dart';

class SignUpViewmodel with ChangeNotifier {
  bool isCheck = false;
  bool isSignUpStart = false;
  bool isPasswordVisible = false;

  bool isSignUpError = false;
  bool isFocusPassword = false;
  bool isFocusEmail = false;
  bool isUiFieldsFill = false;
  bool isFocusPhoneNumber = false;
  bool isHiddenPassword = true;

  naviagtion(
      {required BuildContext context,
      required bool isReplaceMent,
      required bool isPop,
      required navigationName}) {
    if (isReplaceMent == true) {
      isCheck = false;
      isFocusEmail = false;
      isFocusPassword = false;
      isFocusPhoneNumber = false;
      isPasswordVisible = false;
      isHiddenPassword = true;
      isSignUpError = false;
      isSignUpStart = false;
      isUiFieldsFill = false;
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => navigationName()));
    } else if (isPop == true) {
      isCheck = false;
      isFocusEmail = false;
      isFocusPassword = false;
      isFocusPhoneNumber = false;
      isPasswordVisible = false;
      isHiddenPassword = true;
      isSignUpError = false;
      isSignUpStart = false;
      isUiFieldsFill = false;
      notifyListeners();
      Navigator.pop(context);
    } else {
      isCheck = false;
      isFocusEmail = false;
      isFocusPassword = false;
      isFocusPhoneNumber = false;
      isPasswordVisible = false;
      isHiddenPassword = true;
      isSignUpError = false;
      isSignUpStart = false;
      isUiFieldsFill = false;
      notifyListeners();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigationName));
    }
  }

  onChangedFocusOFUi(
      {required String emailText,
      required String PasswordText,
      required String phoneNumber,
      required bool ischeck}) {
    final String number = phoneNumber.toString();

    if ((emailText.length >= 5) &&
        (PasswordText.length >= 4) &&
        (number.length >= 10) &&
        (ischeck == true)) {
      isUiFieldsFill = true;
      print('Check Box Hit Change Focus : ${ischeck}');
      notifyListeners();
    } else {
      isUiFieldsFill = false;
      print('Check Box Hit Change Focus : ${ischeck}');

      notifyListeners();
    }
  }

  void onFocusChange(String field, bool hasFocus) {
    if (field == "email") {
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
    print('Check Box Hit : ${isCheck}');
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

  void onPhoneNumberFocusChange(bool hasFocus) {
    isFocusPhoneNumber = hasFocus;

    notifyListeners();
  }

  validation({
    required String EmailText,
    required String Password,
    required String phoneNumber,
  }) {
    final number = int.parse(phoneNumber);
    if ((EmailText.contains('@') && (EmailText.contains('.com'))) &&
        (Password.length >= 5) &&
        (number != null) &&
        (phoneNumber.length == 10) &&
        (isCheck == true)) {
      return true;
    } else {
      return false;
    }
  }

  signUpFunction(
      {required String Email,
      required String phoneNumber,
      required String Password,
      required BuildContext context}) async {
    isSignUpStart = true;
    notifyListeners();
    bool validate = await validation(
        EmailText: Email, Password: Password, phoneNumber: phoneNumber);
    if (validate == true) {
      print('Navigating and SuccessFully SignUp');
      // SignUpGlobalData.finalFullName = fullname;
      SignUpGlobalData.finalEmailAddress = Email;
      SignUpGlobalData.finalPassword = Password;
      SignUpGlobalData.finalPhoneNumber = phoneNumber;
      isSignUpStart = false;
      notifyListeners();
    } else {
      isSignUpStart = false;
      isSignUpError = true;
      isUiFieldsFill = false;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 4));
      isSignUpError = false;
      notifyListeners();
    }
  }
}
