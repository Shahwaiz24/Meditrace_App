import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Create%20New%20Password%20View/create_newpassword_view.dart';

class EnteringOtpViewmodel with ChangeNotifier {
  String completedOtp = '';
  bool isError = false;
  bool isFieldFills = false;
  bool isStart = false;

  onCompletePin({required String completedString}) {
    if (completedString != null || completedString.isNotEmpty) {
      completedOtp = completedString;
      isFieldFills = true;
      print("OTP : $completedOtp");
      notifyListeners();
    } else {
      isFieldFills = false;
      notifyListeners();
    }
  }

  void navigateToback({required BuildContext context}) {
    isStart = false;
    isFieldFills = false;
    Navigator.pop(context);
  }

  onTapConfirm({required BuildContext context, required String Otp,required String email}) async {
    isStart = true;
    isFieldFills = false;
    notifyListeners();
    if (Otp != null && Otp.isNotEmpty && Otp == OTPvalue.otp) {
      print("OTP Alright and Navigating");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CreateNewpasswordView(email: email,)));
      isStart = false;
    } else {
      isStart = false;
      //  Loading Is False //
      isError = true;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 1));
      isError = false;
      notifyListeners();
    }
  }
}
