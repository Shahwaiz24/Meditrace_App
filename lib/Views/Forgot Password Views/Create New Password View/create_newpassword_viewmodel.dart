import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/api_service.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Password%20Changed%20View/password_changed_view.dart';

class CreateNewpasswordViewmodel with ChangeNotifier {
  bool isFocusPassword = false;
  bool isFocusRepeatPassword = false;
  bool isPasswordNotEmpty = false;
  bool isRepeatPasswordNotEmpty = false;
  bool isError = false;
  bool isStart = false;
  bool isFieldsFill = false;

  bool isPasswordHidden = false;


  void isPasswordFocus({required bool focus}) {
    isFocusPassword = focus;
    notifyListeners();
  }

  void isPasswordRepeatFocus({required bool focus}) {
    isFocusRepeatPassword = focus;
    notifyListeners();
  }

  hiddenText() {
    isPasswordHidden = !isPasswordHidden;
    notifyListeners();
  }

  isRepeatPasswordEmptyCheck({required String passwordRepeat}) {
    if (passwordRepeat.isNotEmpty) {
      isRepeatPasswordNotEmpty = true;
      notifyListeners();
    } else {
      isRepeatPasswordNotEmpty = false;
      notifyListeners();
    }
  }

  isPasswordEmptyCheck({required String password}) {
    if (password.isNotEmpty) {
      isPasswordNotEmpty = true;
      notifyListeners();
    } else {
      isPasswordNotEmpty = false;
      notifyListeners();
    }
  }

  onChangedFunction(
      {required String firstPassword, required String repeatpassword}) {
    if ((firstPassword.isNotEmpty && firstPassword == repeatpassword) &&
        (repeatpassword.isNotEmpty && repeatpassword == firstPassword)) {
      isFieldsFill = true;
      notifyListeners();
    } else {
      isFieldsFill = false;
      notifyListeners();
    }
  }

  onChangedPasswordTap(
      {required String password,
      required String repeatPassword,
      required String email,
      required BuildContext context}) async {
    isStart = true;
    isFieldsFill = false;
    notifyListeners();
    if ((password.isNotEmpty &&
            password.length >= 4 &&
            password == repeatPassword) &&
        (repeatPassword.isNotEmpty &&
            repeatPassword.length >= 4 &&
            repeatPassword == repeatPassword)) {
      print("Everythings Alright Api Work Here");

      final Map jsonMap = {
        "email" : email,
        "password" : password
      };
      var json = jsonEncode(jsonMap);

      bool apicheck = await ApiService.changePassword(body: json);
      if(apicheck == true){
        isFocusPassword = false;
        isPasswordHidden = false;
        isFocusRepeatPassword = false;
        isFieldsFill = false;
        isPasswordNotEmpty = false;
        isError = false;
        isRepeatPasswordNotEmpty = false;
isStart = false;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const PasswordChangedView(isError: false,)));
      }else{
  isFocusPassword = false;
        isPasswordHidden = false;
        isFocusRepeatPassword = false;
        isFieldsFill = false;
        isPasswordNotEmpty = false;
        isError = false;
        isRepeatPasswordNotEmpty = false;
isStart = false;
notifyListeners();
 Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const PasswordChangedView(isError: true,)));
      }
      
    } else {
      isStart = false;
      isFocusPassword = false;
        isPasswordHidden = false;
        isFocusRepeatPassword = false;
        isFieldsFill = false;
        isPasswordNotEmpty = false;
        isRepeatPasswordNotEmpty = false;
      isError = true;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 1500));
      isError = false;
      notifyListeners();
    }
  }

  void navigatetoBack({required BuildContext context}) {
    isStart = false;
    isPasswordHidden = false;
    isFocusRepeatPassword = false;
    isRepeatPasswordNotEmpty = false;
    isPasswordNotEmpty = false;
    isFocusRepeatPassword = false;
    isError = false;
    isFieldsFill = false;
    Navigator.pop(context);
  }
}
