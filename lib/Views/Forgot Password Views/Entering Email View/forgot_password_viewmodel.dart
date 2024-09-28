import 'package:flutter/material.dart';

class ForgotPasswordViewmodel with ChangeNotifier {
  bool isFocusEmail = false;
  bool isEmailNotEmpty = false;
  bool isError = false;
  bool fieldsFill = false;
  bool isStart = false;

  void onEmailFocusChange({required focus}) {
    isFocusEmail = focus;
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

  checkFields({required String email}) {
    if ((email.isNotEmpty) &&
        (email.contains("@")) &&
        (email.contains(".com"))) {
      fieldsFill = true;
      notifyListeners();
    } else {
      fieldsFill = false;
      ;
      notifyListeners();
    }
  }

  void navigateToback({required BuildContext context}) {
    isStart = false;
    fieldsFill = false;
    Navigator.pop(context);
  }

  sentOtpTap({required String email}) {
    if (fieldsFill == true && isStart == false) {
      isStart = true;
      fieldsFill = false;
      notifyListeners();
      print(
          "All Okay and Api Work Have to be Here \n Navigate to Next Otp Verifying Screen");
          
    }
  }
}
