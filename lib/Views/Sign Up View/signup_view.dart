import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/signup_viewmodel.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double checkboxSize = MediaQuery.of(context).size.width * 0.05;

    final model = Provider.of<SignUpViewmodel>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      body: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.100,
            left: screenWidth * 0.070,
            right: screenWidth * 0.070),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: AppColors.TextblackColor,
                              fontSize: screenHeight * 0.020,
                              fontFamily: "Poppins Bold"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            size: screenHeight * 0.030,
                            Icons.arrow_back_ios_new,
                            color: AppColors.ButtonBackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(builder: (context, model, child) {
                  return TextFields(
                      controller: fullName,
                      enablefillColor:
                          AppColors.unFocusPrimaryColor.withOpacity(0.1),
                      focusfillColor: AppColors.TextwhiteColor,
                      outlineColor:
                          AppColors.unFocusPrimaryColor.withOpacity(0.5),
                      radius: screenHeight * 0.010,
                      isHidden: false,
                      HintText: 'Full Name',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins Regular',
                          fontSize: screenHeight * 0.018),
                      isEmailFocus: true,
                      Prefix: Icon(
                        Icons.person_outline_rounded,
                        color: const Color(0xffA3A2A3).withOpacity(0.8),
                        size: screenHeight * 0.032,
                      ),
                      Suffix: Text(''),
                      isSuffix: false,
                      isPrefix: true,
                      onChanged: () {});
                }),
                SizedBox(
                  height: screenHeight * 0.030,
                ),
                Consumer(builder: (context, model, child) {
                  return TextFields(
                      controller: emailController,
                      enablefillColor:
                          AppColors.unFocusPrimaryColor.withOpacity(0.1),
                      focusfillColor: AppColors.TextwhiteColor,
                      outlineColor:
                          AppColors.unFocusPrimaryColor.withOpacity(0.5),
                      radius: screenHeight * 0.010,
                      isHidden: false,
                      HintText: 'Email Address',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins Regular',
                          fontSize: screenHeight * 0.018),
                      isEmailFocus: true,
                      Prefix: Icon(
                        Icons.email_outlined,
                        color: const Color(0xffA3A2A3).withOpacity(0.8),
                        size: screenHeight * 0.032,
                      ),
                      Suffix: Text(''),
                      isSuffix: false,
                      isPrefix: true,
                      onChanged: () {});
                }),
                SizedBox(
                  height: screenHeight * 0.030,
                ),
                Consumer(builder: (context, model, child) {
                  return TextFields(
                      controller: phoneNumberController,
                      enablefillColor:
                          AppColors.unFocusPrimaryColor.withOpacity(0.1),
                      focusfillColor: AppColors.TextwhiteColor,
                      outlineColor:
                          AppColors.unFocusPrimaryColor.withOpacity(0.5),
                      radius: screenHeight * 0.010,
                      isHidden: false,
                      HintText: 'Phone Number',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins Regular',
                          fontSize: screenHeight * 0.018),
                      isEmailFocus: true,
                      Prefix: Icon(
                        Icons.call_outlined,
                        color: const Color(0xffA3A2A3).withOpacity(0.8),
                        size: screenHeight * 0.032,
                      ),
                      Suffix: Text(''),
                      isSuffix: false,
                      isPrefix: true,
                      onChanged: () {});
                }),
                SizedBox(
                  height: screenHeight * 0.030,
                ),
                Consumer(builder: (context, model, child) {
                  return TextFields(
                      controller: passwordController,
                      enablefillColor:
                          AppColors.unFocusPrimaryColor.withOpacity(0.1),
                      focusfillColor: AppColors.TextwhiteColor,
                      outlineColor:
                          AppColors.unFocusPrimaryColor.withOpacity(0.5),
                      radius: screenHeight * 0.010,
                      isHidden: false,
                      HintText: 'Password',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Poppins Regular',
                          fontSize: screenHeight * 0.018),
                      isEmailFocus: true,
                      Prefix: Icon(
                        Icons.lock_outline_rounded,
                        color: AppColors.unFocusPrimaryColor.withOpacity(0.8),
                        size: screenHeight * 0.032,
                      ),
                      Suffix: const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black,
                      ),
                      isSuffix: true,
                      isPrefix: true,
                      onChanged: () {});
                }),
                SizedBox(
                  height: screenHeight * 0.030,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Consumer<SignUpViewmodel>(builder: (context, model, child) {
                    return InkWell(
                      onTap: () {
                        model.checkBoxHit();
                      },
                      child: Container(
                        height: checkboxSize,
                        width: checkboxSize,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.010),
                            border: Border.all(
                                color:
                                    AppColors.TextblackColor.withOpacity(0.4))),
                        child: model.isCheck == true
                            ? Center(
                                child: Icon(
                                  size: checkboxSize,
                                  Icons.check_outlined,
                                  color: AppColors.unFocusPrimaryColor,
                                ),
                              )
                            : Text(''),
                      ),
                    );
                  }),
                  SizedBox(
                    width: screenWidth * 0.050,
                  ),
                  Expanded(
                      child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: AppColors.TextblackColor,
                        fontSize: screenHeight * 0.018,
                        fontFamily: 'Poppins Regular',
                      ),
                      children: [
                        TextSpan(text: 'I agree to the '),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            color: AppColors.PrimaryBlueColor,
                            fontSize: screenHeight * 0.018,
                            fontFamily: 'Poppins Regular',
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle "Terms of Service" link tap
                              print("Terms of Service tapped");
                            },
                        ),
                        TextSpan(text: ' \nand '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            fontSize: screenHeight * 0.018,
                            fontFamily: 'Poppins Regular',
                            color: AppColors.PrimaryBlueColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle "Privacy Policy" link tap
                              print("Privacy Policy tapped");
                            },
                        ),
                      ],
                    ),
                  ))
                ]),
              ],
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: InkWell(
                  child: ButtonComponent(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      ButtonHeight: 0.075,
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: AppColors.TextwhiteColor,
                              fontFamily: 'Poppins Semi Bold',
                              fontSize: screenHeight * 0.020),
                        ),
                      ),
                      radius: 0.080,
                      backgroundColor: AppColors.PrimaryBlueColor),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.040),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {},
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(
                            color: AppColors.TextblackColor,
                            fontFamily: 'Poppins Medium',
                            fontSize: screenHeight * 0.018),
                      )),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        '  Sign in',
                        style: TextStyle(
                            color: AppColors.PrimaryBlueColor,
                            fontFamily: 'Poppins Bold',
                            fontSize: screenHeight * 0.018),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
