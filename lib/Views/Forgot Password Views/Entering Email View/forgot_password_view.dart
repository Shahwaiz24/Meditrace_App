import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Entering%20Email%20View/forgot_password_viewmodel.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ForgotPasswordViewmodel>(context);
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
              "Get a verification code",
              style: TextStyle(
                  fontFamily: "Poppins Bold",
                  fontSize: screenHeight * 0.020,
                  color: AppColors.TextblackColor),
            ),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            Text(
                "Please enter the email associated with your\nMediTrace account. ",
                style: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: "Poppins Regular",
                    fontSize: screenHeight * 0.018)),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<ForgotPasswordViewmodel>(builder: (context, model, child) {
              return TextFields(
                  controller: emailController,
                  enablefillColor: Colors.black,
                  focusfillColor: model.isFocusEmail == true
                      ? AppColors.TextwhiteColor
                      : model.isEmailNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: 
                  
                  model.isError == true
                      ? Colors.red
                      : AppColors.unFocusPrimaryColor.withOpacity(0.5),

                      
                  radius: screenWidth * 0.020,
                  isHidden: false,
                  HintText: model.isError == true
                      ? "User Didn't Exist"
                      : "Email Address",
                  hintStyle: TextStyle(
                    color: model.isError
                        ? Colors.red
                        : AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: model.isFocusEmail == true
                      ? const Icon(
                          Icons.email_outlined,
                        )
                      : model.isEmailNotEmpty == true
                          ? const Icon(
                              Icons.email_outlined,
                            )
                          : Icon(
                              Icons.email_outlined,
                              color: const Color(0xffA3A2A3).withOpacity(0.8),
                              size: screenHeight * 0.032,
                            ),
                  Suffix: Text(''),
                  isSuffix: false,
                  isNumberKeyboard: false,
                  isPrefix: true,
                  onFocus: (focus) {
                    model.onEmailFocusChange(focus: focus);
                  },
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    model.isEmailEmptyCheck(email: emailController.text);
                    model.checkFields(email: emailController.text);
                  });
            }),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  "Didn’t receive the code?",
                  style: TextStyle(
                      color: AppColors.unFocusPrimaryColor,
                      fontFamily: "Poppins Medium",
                      fontSize: screenHeight * 0.017),
                ),
                InkWell(
                  onTap: () {
                    if (model.isStart == false) {
                      model.sentOtpTap(
                          email: emailController.text, context: context);
                    }
                  },
                  child: Text(
                    " Resend",
                    style: TextStyle(
                        color: AppColors.PrimaryBlueColor,
                        fontFamily: "Poppins Medium",
                        fontSize: screenHeight * 0.017),
                  ),
                )
              ],
            ),
            const Spacer(),
            Consumer<ForgotPasswordViewmodel>(builder: (context, model, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (model.isStart == false) {
                          model.sentOtpTap(
                              email: emailController.text, context: context);
                        }
                      },
                      child: ButtonComponent(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          ButtonHeight: 0.075,
                          decoration: BoxDecoration(
                              color: model.fieldsFill == true
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
                                    'Send Code',
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
            })
          ],
        ),
      ),
    );
  }
}
