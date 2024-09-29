import 'package:flutter/material.dart';

class EnteringOtpViewmodel with ChangeNotifier {
  String completedOtp = '';

  onComplete({required String completedString}) {
    completedOtp = completedString;
    print("OTP : $completedOtp");
    notifyListeners();
  }
}
