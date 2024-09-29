import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Entering%20OTP%20View/entering_otp_view.dart';

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

  sentOtpTap({required String email, required BuildContext context}) async {
    if (fieldsFill == true &&
        isStart == false &&
        (email.isNotEmpty) &&
        (email.contains("@")) &&
        (email.contains(".com"))) {
      isStart = true;
      fieldsFill = false;
      notifyListeners();
      print(
          "All Okay and Api Work Have to be Here \n Navigate to Next Otp Verifying Screen");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EnteringOtpView()));
      OTPvalue.otp = "2024";
      await Future.delayed(const Duration(seconds: 1));
      isStart = false;
    }
  }
}
