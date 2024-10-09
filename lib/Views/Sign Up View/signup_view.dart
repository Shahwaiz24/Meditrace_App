import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Sign%20In%20View/signin_view.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/signup_viewmodel.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    double checkboxSize = MediaQuery.of(context).size.width * 0.05;

    final model = Provider.of<SignUpViewmodel>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                            model.naviagtion(
                                context: context,
                                isReplaceMent: false,
                                isPop: true,
                                navigationName: "");
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.080,
                  ),
                  // Spacer(),
                  Consumer<SignUpViewmodel>(builder: (context, model, child) {
                    return TextFields(
                        contentStyle: const TextStyle(
                            fontFamily: 'Poppins Regular',
                            fontWeight: FontWeight.w500),
                        onFocus: (value) {
                          model.onFocusChange('email', value);
                        },
                        isNumberKeyboard: false,
                        controller: emailController,
                        enablefillColor:
                            AppColors.unFocusPrimaryColor.withOpacity(0.1),
                        focusfillColor: model.isFocusEmail == true
                            ? AppColors.TextwhiteColor
                            : model.isEmailNotEmpty == true
                                ? AppColors.TextwhiteColor
                                : AppColors.unFocusPrimaryColor
                                    .withOpacity(0.1),
                        outlineColor: model.isSignUpError
                            ? Colors.red.withOpacity(0.5)
                            : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                        radius: screenHeight * 0.010,
                        isHidden: false,
                        HintText: model.isSignUpError == true
                            ? "Enter Correct Email Address"
                            : 'Email Address',
                        hintStyle: TextStyle(
                            color: model.isSignUpError
                                ? Colors.red.withOpacity(0.5)
                                : Colors.grey,
                            fontFamily: 'Poppins Regular',
                            fontSize: screenHeight * 0.018),
                        Prefix: model.isFocusEmail == true
                            ? Icon(
                                Icons.email_outlined,
                              )
                            : Icon(
                                Icons.email_outlined,
                                color: const Color(0xffA3A2A3).withOpacity(0.8),
                                size: screenHeight * 0.032,
                              ),
                        Suffix: Text(''),
                        isSuffix: false,
                        isPrefix: true,
                        onChanged: (value) async {
                          await model.checkEmailEmpty(
                              email: emailController.text);
                          await model.onChangedFocusOFUi(
                              ischeck: model.isCheck,
                              phoneNumber: phoneNumberController.text,
                              emailText: emailController.text,
                              PasswordText: passwordController.text);
                        });
                  }),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),
                  Consumer<SignUpViewmodel>(builder: (context, model, child) {
                    return TextFields(
                        contentStyle: const TextStyle(
                            fontFamily: 'Poppins Regular',
                            fontWeight: FontWeight.w500),
                        onFocus: (value) {
                          model.onFocusChange('phoneNumber', value);
                        },
                        isNumberKeyboard: true,
                        controller: phoneNumberController,
                        enablefillColor: Colors.black,
                        focusfillColor: model.isFocusPhoneNumber == true
                            ? AppColors.TextwhiteColor
                            : model.isPhoneNumberNotEmpty == true
                                ? AppColors.TextwhiteColor
                                : AppColors.unFocusPrimaryColor
                                    .withOpacity(0.1),
                        outlineColor: model.isSignUpError
                            ? Colors.red.withOpacity(0.5)
                            : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                        radius: screenHeight * 0.010,
                        isHidden: false,
                        HintText: model.isSignUpError == true
                            ? "Enter 10 Digits Number"
                            : 'Phone Number',
                        hintStyle: TextStyle(
                            color: model.isSignUpError
                                ? Colors.red.withOpacity(0.5)
                                : Colors.grey,
                            fontFamily: 'Poppins Regular',
                            fontSize: screenHeight * 0.018),
                        Prefix: model.isFocusPhoneNumber == true
                            ? Icon(Icons.call_outlined)
                            : Icon(
                                Icons.call_outlined,
                                color: AppColors.unFocusPrimaryColor.withOpacity(0.8),
                                size: screenHeight * 0.032,
                              ),
                        Suffix: Text(''),
                        isSuffix: false,
                        isPrefix: true,
                        onChanged: (value) async {
                          await model.checkPhoneNumberEmpty(
                              phoneNumber: phoneNumberController.text);
                          await model.onChangedFocusOFUi(
                              ischeck: model.isCheck,
                              phoneNumber: phoneNumberController.text,
                              emailText: emailController.text,
                              PasswordText: passwordController.text);
                        });
                  }),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),
                  Consumer<SignUpViewmodel>(builder: (context, model, child) {
                    return TextFields(
                        contentStyle: const TextStyle(
                            fontFamily: 'Poppins Regular',
                            fontWeight: FontWeight.w500),
                        onFocus: (value) {
                          model.onFocusChange('password', value);
                        },
                        isNumberKeyboard: false,
                        controller: passwordController,
                        enablefillColor:
                            AppColors.unFocusPrimaryColor.withOpacity(0.1),
                        focusfillColor: model.isFocusPassword == true
                            ? AppColors.TextwhiteColor
                            : model.isPasswordNotEmpty == true
                                ? AppColors.TextwhiteColor
                                : AppColors.unFocusPrimaryColor
                                    .withOpacity(0.1),
                        outlineColor: model.isSignUpError
                            ? Colors.red.withOpacity(0.5)
                            : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                        radius: screenHeight * 0.010,
                        isHidden: model.isHiddenPassword,
                        HintText: model.isSignUpError == true
                            ? "Enter Password with @, Capital, Number"
                            : 'Password',
                        hintStyle: TextStyle(
                            color: model.isSignUpError
                                ? Colors.red.withOpacity(0.5)
                                : Colors.grey,
                            fontFamily: 'Poppins Regular',
                            fontSize: screenHeight * 0.018),
                        Prefix: model.isFocusPassword == true
                            ? Icon(
                                Icons.lock_outline_rounded,
                              )
                            : Icon(
                                Icons.lock_outline_rounded,
                                color: AppColors.unFocusPrimaryColor
                                    .withOpacity(0.8),
                                size: screenHeight * 0.032,
                              ),
                        Suffix: passwordController.text.isEmpty
                            ? const Text('')
                            : Padding(
                                padding:
                                    EdgeInsets.only(right: screenWidth * 0.030),
                                child: InkWell(
                                  onTap: () {
                                    model.hiddenText();
                                  },
                                  child: model.isHiddenPassword
                                      ? const Icon(
                                          Icons.visibility_off_outlined,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility_outlined,
                                          color: Colors.black,
                                        ),
                                ),
                              ),
                        isSuffix: model.isPasswordVisible,
                        isPrefix: true,
                        onChanged: (value) async {
                          await model.checkPasswordEmpty(
                              password: passwordController.text);
                          await model.onChangedFocusOFUi(
                              ischeck: model.isCheck,
                              phoneNumber: phoneNumberController.text,
                              emailText: emailController.text,
                              PasswordText: passwordController.text);
                        });
                  }),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Consumer<SignUpViewmodel>(builder: (context, model, child) {
                      return InkWell(
                        onTap: () async {
                          await model.checkBoxHit();
                          await model.onChangedFocusOFUi(
                              ischeck: model.isCheck,
                              phoneNumber: phoneNumberController.text,
                              emailText: emailController.text,
                              PasswordText: passwordController.text);
                        },
                        child: Container(
                          height: checkboxSize,
                          width: checkboxSize,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.010),
                              border: Border.all(
                                  color: AppColors.TextblackColor.withOpacity(
                                      0.4))),
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
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                    child: Column(
                      children: [
                        Consumer<SignUpViewmodel>(
                            builder: (context, model, child) {
                          return InkWell(
                            onTap: () async {
                              if (model.isSignUpStart == false)  {
                              await  model.signUpFunction(
                                    Email: emailController.text,
                                    phoneNumber:
                                        phoneNumberController.text,
                                    Password: passwordController.text,
                                    context: context);
                                emailController.clear();
                                phoneNumberController.clear();
                                passwordController.clear();
                              }
                            },
                            child: ButtonComponent(
                              decoration: BoxDecoration(
                                  color: model.isUiFieldsFill == true
                                      ? AppColors.PrimaryBlueColor
                                      : AppColors.unFocusPrimaryColor,
                                  borderRadius: BorderRadius.circular(
                                      screenWidth * 0.080)),
                              screenHeight: screenHeight,
                              screenWidth: screenWidth,
                              ButtonHeight: 0.075,
                              child: model.isSignUpStart
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.TextwhiteColor,
                                      ),
                                    )
                                  : Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            color: AppColors.TextwhiteColor,
                                            fontFamily: 'Poppins Semi Bold',
                                            fontSize: screenHeight * 0.020),
                                      ),
                                    ),
                            ),
                          );
                        }),
                        
                        
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.020),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    model.naviagtion(
                                        context: context,
                                        isReplaceMent: false,
                                        isPop: false,
                                        navigationName: SigninView());
                                  },
                                  child: Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                        color: AppColors.TextblackColor,
                                        fontFamily: 'Poppins Medium',
                                        fontSize: screenHeight * 0.018),
                                  )),
                              InkWell(
                                  onTap: () {
                                    model.naviagtion(
                                        context: context,
                                        isReplaceMent: false,
                                        isPop: false,
                                        navigationName: SigninView());
                                  },
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
