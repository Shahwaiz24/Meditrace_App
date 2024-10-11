import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/api_service.dart';
import 'package:meditrace_project/Services/global_Data.dart';
import 'package:meditrace_project/Services/local_storage.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Entering%20Email%20View/forgot_password_view.dart';
import 'package:meditrace_project/Views/Home%20View/home_view.dart';
import 'package:meditrace_project/Views/Splash%20View/splash_view.dart';

class SigninViewmodel with ChangeNotifier {
  static String user_id = '';
  bool isPasswordVisible = false;
  bool isSignInStart = false;
  bool isUiFieldsFill = false;
  bool isHiddenPassword = true;
  bool isFocusEmail = false;
  bool isSignUpError = false;
  bool isEmailNotEmpty = false;
  bool isPasswordNotEmpty = false;
  void onEmailFocusChange(bool hasFocus) {
    isFocusEmail = hasFocus;

    notifyListeners();
  }

  isEmailEmptyCheck({required String email}) {
    if (email.isNotEmpty) {
      isEmailNotEmpty = true;
      notifyListeners();
    } else {
      isEmailNotEmpty = false;
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

  hiddenText() {
    isHiddenPassword = !isHiddenPassword;
    notifyListeners();
  }

  onChangedFocusOFUi(
      {required String emailText, required String PasswordText}) {
    if ((emailText.length >= 5) && (PasswordText.length >= 4)) {
      isUiFieldsFill = true;
      notifyListeners();
    } else {
      isUiFieldsFill = false;
      notifyListeners();
    }
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

  bool isFocusPassword = false; // Focus state track karne ke liye
  void onPasswordFocusChange(bool hasFocus) {
    isFocusPassword = hasFocus;

    notifyListeners();
  }

  validation({required String EmailText, required String Password}) {
    if ((EmailText.contains('@') && (EmailText.contains('.com'))) &&
        (Password.length >= 5)) {
      return true;
    } else {
      return false;
    }
  }

  void navigateToForgotPassword({required BuildContext context}) {
    isUiFieldsFill = false;
    isSignInStart = false;
    isSignUpError = false;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgotPasswordView()));
  }

  signInFunction(
      {required String Email,
      required String Password,
      required BuildContext context}) async {
    isSignInStart = true;
    isUiFieldsFill = false;
    notifyListeners();
    bool validate = await validation(EmailText: Email, Password: Password);
    if (validate == true) {
      final Map forparseBody = {"email": Email, "password": Password};
      var finalBody = jsonEncode(forparseBody);
      bool apiCheck = await ApiService.loginUser(body: finalBody);

      if (apiCheck == true) {
        isFocusEmail = false;
        isSignInStart = false;
        isFocusPassword = false;
        isPasswordVisible = false;
        isHiddenPassword = true;
        isSignUpError = false;
        isUiFieldsFill = false;
        notifyListeners();
        await LocalStorage.userLogin();
        await LocalStorage.saveUserId(userId: SigninViewmodel.user_id);
        print("Saved Id and Login ");
        Navigator.of(context).popUntil((route) => route.isFirst);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeView()),
        );
      } else {
        isFocusEmail = false;
        isSignInStart = false;
        isFocusPassword = false;
        isPasswordVisible = false;
        isHiddenPassword = true;
        isSignUpError = true;
        isUiFieldsFill = false;
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 1500));
        isSignUpError = false;
        notifyListeners();
      }
    } else {
      isFocusEmail = false;
      isSignInStart = false;
      isFocusPassword = false;
      isPasswordVisible = false;
      isHiddenPassword = true;
      isSignUpError = true;
      isUiFieldsFill = false;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 1500));

      isSignUpError = false;
      notifyListeners();
    }
  }

  naviagtion(
      {required BuildContext context,
      required bool isReplaceMent,
      required bool isPop,
      required navigationName}) {
    if (isReplaceMent == true) {
      isFocusEmail = false;
      isSignInStart = false;
      isFocusPassword = false;
      isPasswordVisible = false;
      isHiddenPassword = true;
      isSignUpError = false;
      isUiFieldsFill = false;
      notifyListeners();
      Navigator.of(context).popUntil((route) => route.isFirst);

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => navigationName()));
    } else if (isPop == true) {
      isFocusEmail = false;
      isFocusPassword = false;
      isPasswordVisible = false;
      isSignInStart = false;

      isHiddenPassword = true;
      isSignUpError = false;
      isUiFieldsFill = false;
      notifyListeners();
      Navigator.of(context).popUntil((route) => route.isFirst);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashView()),
      );
    } else {
      isFocusEmail = false;
      isFocusPassword = false;
      isPasswordVisible = false;
      isHiddenPassword = true;
      isSignInStart = false;

      isSignUpError = false;
      isUiFieldsFill = false;
      notifyListeners();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigationName));
    }
  }
}
