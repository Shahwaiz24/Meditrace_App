import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/otp_textfield.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Entering%20OTP%20View/entering_otp_viewmodel.dart';
import 'package:provider/provider.dart';

class EnteringOtpView extends StatelessWidget {
  const EnteringOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EnteringOtpViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.100,
          left: screenWidth * 0.070,
          right: screenWidth * 0.070,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot password?",
              style: TextStyle(
                  color: AppColors.PrimaryBlueColor,
                  fontFamily: 'Poppins Medium',
                  fontSize: screenHeight * 0.018),
            ),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            Text(
              "Enter your OTP Code",
              style: TextStyle(
                  fontFamily: "Poppins Bold",
                  fontSize: screenHeight * 0.020,
                  color: AppColors.TextblackColor),
            ),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            Text("We have sent the verification code to your \nemail address",
                style: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: "Poppins Regular",
                    fontSize: screenHeight * 0.018)),
            SizedBox(
              height: screenHeight * 0.040,
            ),
            OtpFieldComponent(
              completed: (value) {
                model.onComplete(completedString: value!);
              },
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              isError: false,
            )
          ],
        ),
      ),
    );
  }
}
