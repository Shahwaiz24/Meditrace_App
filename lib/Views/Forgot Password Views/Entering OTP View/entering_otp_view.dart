import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/otp_textfield.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Entering%20OTP%20View/entering_otp_viewmodel.dart';
import 'package:provider/provider.dart';

class EnteringOtpView extends StatelessWidget {
  EnteringOtpView({super.key});

  final TextEditingController otpController = TextEditingController();

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
              controller: otpController,
              completed: (value) {
                model.onCompletePin(completedString: value!);
              },
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              isError: model.isError,
            ),
            SizedBox(
              height: screenHeight * 0.040,
            ),
            Text(
              "Your 4-digit code is on it’s way. It may take a \nfew moments to arrive. If you still don’t see it,\nyou can resend the code",
              style: TextStyle(
                  color: AppColors.unFocusPrimaryColor,
                  fontFamily: "Poppins Regular",
                  fontSize: screenHeight * 0.017),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<EnteringOtpViewmodel>(builder: (context, model, child) {
              return InkWell(
                onTap: () {
                  if (model.isStart == false) {
                    otpController.clear();
                  }
                },
                child: Text(
                  "Send new code",
                  style: TextStyle(
                      color: model.isFieldFills == true
                          ? AppColors.unFocusPrimaryColor
                          : AppColors.PrimaryBlueColor,
                      fontFamily: "Poppins Medium",
                      fontSize: screenHeight * 0.018),
                ),
              );
            }),
            const Spacer(),
            Consumer<EnteringOtpViewmodel>(builder: (context, model, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (model.isStart == false) {
                          model.onTapConfirm(
                              context: context, Otp: model.completedOtp);
                          otpController.clear();
                        }
                      },
                      child: ButtonComponent(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          ButtonHeight: 0.075,
                          decoration: BoxDecoration(
                              color: model.isFieldFills == true
                                  ? AppColors.PrimaryBlueColor
                                  : AppColors.unFocusPrimaryColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.080)),
                          child: Center(
                            child: model.isStart == true
                                ? CircularProgressIndicator(
                                    color: AppColors.TextwhiteColor,
                                  )
                                : Text(
                                    'Confirm',
                                    style: TextStyle(
                                        color: AppColors.TextwhiteColor,
                                        fontFamily: 'Poppins Semi Bold',
                                        fontSize: screenHeight * 0.020),
                                  ),
                          )),
                    ),
                    SizedBox(height: screenHeight * 0.010),
                    InkWell(
                      onTap: () {
                        if (model.isStart == false) {
                          otpController.clear();
                          model.navigateToback(context: context);
                        }
                      },
                      child: Text(
                        'Go Back',
                        style: TextStyle(
                            color: AppColors.PrimaryBlueColor,
                            fontFamily: "Poppins Bold",
                            fontSize: screenHeight * 0.018),
                      ),
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
