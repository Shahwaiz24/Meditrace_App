import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Create%20New%20Password%20View/create_newpassword_viewmodel.dart';
import 'package:provider/provider.dart';

class CreateNewpasswordView extends StatelessWidget {
  CreateNewpasswordView({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CreateNewpasswordViewmodel>(context);
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
              "Create New Password",
              style: TextStyle(
                  fontFamily: "Poppins Bold",
                  fontSize: screenHeight * 0.020,
                  color: AppColors.TextblackColor),
            ),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            Text("Update your password for enhanced account\nsecurity.",
                style: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: "Poppins Regular",
                    fontSize: screenHeight * 0.017)),
            SizedBox(
              height: screenHeight * 0.040,
            ),
            Consumer<CreateNewpasswordViewmodel>(
                builder: (context, model, child) {
              return TextFields(
                  controller: passwordController,
                  enablefillColor: Colors.black,
                  focusfillColor: model.isFocusPassword == true
                      ? AppColors.TextwhiteColor
                      : model.isPasswordNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: model.isError == true
                      ? Colors.red
                      : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                  radius: BorderRadius.circular(screenWidth * 0.020),
                  isHidden: model.isPasswordHidden,
                  HintText: "Enter Password",
                  hintStyle: TextStyle(
                    color: model.isError
                        ? Colors.red
                        : AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: model.isFocusPassword
                      ? const ImageIcon(
                          AssetImage("assets/images/icon/password_icon.png"),
                          color: Colors.black,
                        )
                      : model.isPasswordNotEmpty == true
                          ? const ImageIcon(
                              AssetImage(
                                  "assets/images/icon/password_icon.png"),
                              color: Colors.black,
                            )
                          : ImageIcon(
                              const AssetImage(
                                  "assets/images/icon/password_icon.png"),
                              color: AppColors.unFocusPrimaryColor
                                  .withOpacity(0.8),
                              size: screenHeight * 0.032,
                            ),
                  Suffix: model.isPasswordNotEmpty == false
                      ? const Text('')
                      : Padding(
                          padding: EdgeInsets.only(right: screenWidth * 0.030),
                          child: InkWell(
                            onTap: () {
                              model.hiddenText();
                            },
                            child: model.isPasswordHidden == true
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
                  isSuffix: true,
                  isNumberKeyboard: false,
                  isPrefix: true,
                  onFocus: (value) {
                    model.isPasswordFocus(focus: value);
                  },
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    model.isPasswordEmptyCheck(
                        password: passwordController.text);
                    model.onChangedFunction(
                        firstPassword: passwordController.text,
                        repeatpassword: repeatPasswordController.text);
                  });
            }),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<CreateNewpasswordViewmodel>(
                builder: (context, model, child) {
              return TextFields(
                  controller: repeatPasswordController,
                  enablefillColor: Colors.black,
                  focusfillColor: model.isFocusRepeatPassword == true
                      ? AppColors.TextwhiteColor
                      : model.isRepeatPasswordNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: model.isError == true
                      ? Colors.red
                      : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                  radius: BorderRadius.circular(screenWidth * 0.020),
                  isHidden: model.isPasswordHidden,
                  HintText: "Confirm Password",
                  hintStyle: TextStyle(
                    color: model.isError
                        ? Colors.red
                        : AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: model.isFocusRepeatPassword
                      ? const ImageIcon(
                          AssetImage("assets/images/icon/password_icon.png"),
                          color: Colors.black,
                        )
                      : model.isRepeatPasswordNotEmpty == true
                          ? const ImageIcon(
                              AssetImage(
                                  "assets/images/icon/password_icon.png"),
                              color: Colors.black,
                            )
                          : ImageIcon(
                              const AssetImage(
                                  "assets/images/icon/password_icon.png"),
                              color: AppColors.unFocusPrimaryColor
                                  .withOpacity(0.8),
                              size: screenHeight * 0.032,
                            ),
                  Suffix: model.isRepeatPasswordNotEmpty == false
                      ? const Text('')
                      : Padding(
                          padding: EdgeInsets.only(right: screenWidth * 0.030),
                          child: InkWell(
                            onTap: () {
                              model.hiddenText();
                            },
                            child: model.isPasswordHidden == true
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
                  isSuffix: true,
                  isNumberKeyboard: false,
                  isPrefix: true,
                  onFocus: (value) {
                    model.isPasswordRepeatFocus(focus: value);
                  },
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    model.isRepeatPasswordEmptyCheck(
                        passwordRepeat: repeatPasswordController.text);
                    model.onChangedFunction(
                        firstPassword: passwordController.text,
                        repeatpassword: repeatPasswordController.text);
                  });
            }),
            const Spacer(),
            Consumer<CreateNewpasswordViewmodel>(
                builder: (context, model, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (model.isStart == false) {
                          model.onChangedPasswordTap(
                              password: passwordController.text,
                              repeatPassword: repeatPasswordController.text,
                              context: context);
                          passwordController.clear();
                          repeatPasswordController.clear();
                        }
                      },
                      child: ButtonComponent(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          ButtonHeight: 0.075,
                          decoration: BoxDecoration(
                              color: model.isFieldsFill == true
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
                                    'Change Password',
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
                          passwordController.clear();
                          repeatPasswordController.clear();
                          model.navigatetoBack(context: context);
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
