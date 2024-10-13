import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/api_service.dart';
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
      
      final Map Forjson = {
        "email" : email
      };
      var json = await jsonEncode(Forjson);
    bool apiCheck = await ApiService.sendOtp(body: json);
    if(apiCheck == true){
      isStart = false;
      isError = false;
      fieldsFill = false;
      isEmailNotEmpty = false;
print(
          "Navigate to Next Otp Verifying Screen");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EnteringOtpView(email: email,)));
    }else{
       isStart = false;
      fieldsFill = false;
      isEmailNotEmpty = false;
      isError = true;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 1500));
      isError = false;
      notifyListeners();
    }
      
     
    }else{
       isStart = false;
      fieldsFill = false;
      isEmailNotEmpty = false;
      isError = true;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 1500));
      isError = false;
      notifyListeners();
    }

  }
}
