import 'package:flutter/material.dart';

class SigninViewmodel with ChangeNotifier {
  bool isPasswordVisible = false;
  bool isSignInStart = false;
  bool isUiFieldsFill = false;
  bool isHiddenPassword = true;
  bool isFocusEmail = false; // Focus state track karne ke liye
  bool isSignUpError = false;
  void onEmailFocusChange(bool hasFocus) {
    isFocusEmail = hasFocus;

    notifyListeners();
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

  signInFunction(
      {required String Email,
      required String Password,
      required BuildContext context}) async {
    isSignInStart = true;
    notifyListeners();
    bool validate = await validation(EmailText: Email, Password: Password);
    if (validate == true) {
      print('Navigating and SuccessFully Login');

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => HomeView()));
      isSignInStart = false;
      notifyListeners();
    } else {
      isSignInStart = false;
      isSignUpError = true;
      isUiFieldsFill = false;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 3));
      isSignUpError = false;
      notifyListeners();
    }
  }
}
