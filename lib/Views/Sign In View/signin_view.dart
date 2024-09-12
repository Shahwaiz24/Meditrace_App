import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Sign%20In%20View/signin_viewmodel.dart';
import 'package:provider/provider.dart';

class SigninView extends StatelessWidget {
  SigninView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final model = Provider.of<SigninViewmodel>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      body: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.100,
            left: screenWidth * 0.050,
            right: screenWidth * 0.050),
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
                          'Sign In',
                          style: TextStyle(
                              color: AppColors.TextblackColor,
                              fontSize: screenHeight * 0.020,
                              fontFamily: "Poppins Bold"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          size: screenHeight * 0.030,
                          Icons.arrow_back_ios_new,
                          color: AppColors.ButtonBackColor,
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
                  Consumer<SigninViewmodel>(builder: (context, model, child) {
                    return TextFields(
                        isHidden: false,
                        onChanged: () {},
                        isSuffix: false,
                        Suffix: Text(''),
                        Prefix: model.isFocusEmail == true
                            ? const Icon(
                                Icons.email_outlined,
                              )
                            : Icon(
                                Icons.email_outlined,
                                color: const Color(0xffA3A2A3).withOpacity(0.8),
                                size: screenHeight * 0.032,
                              ),
                        isPrefix: true,
                        isEmailFocus: true,
                        controller: emailController,
                        enablefillColor:
                            AppColors.unFocusPrimaryColor.withOpacity(0.1),
                        focusfillColor: AppColors.TextwhiteColor,
                        outlineColor:
                            AppColors.unFocusPrimaryColor.withOpacity(0.5),
                        radius: screenHeight * 0.010,
                        HintText: 'Email Address',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins Regular',
                            fontSize: screenHeight * 0.018));
                  }),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Consumer<SigninViewmodel>(builder: (context, model, child) {
                    return TextFields(
                        isHidden: model.isHiddenPassword,
                        onChanged: () {
                          model.onChanged(controller: passwordController);
                        },
                        isSuffix: model.isPasswordVisible,
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
                        isPrefix: true,
                        Prefix: model.isFocusPassword
                            ? const Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.lock_outline_rounded,
                                color: AppColors.unFocusPrimaryColor
                                    .withOpacity(0.8),
                                size: screenHeight * 0.032,
                              ),
                        isEmailFocus: false,
                        controller: passwordController,
                        enablefillColor:
                            AppColors.unFocusPrimaryColor.withOpacity(0.1),
                        focusfillColor: AppColors.TextwhiteColor,
                        outlineColor:
                            AppColors.unFocusPrimaryColor.withOpacity(0.5),
                        radius: screenHeight * 0.010,
                        HintText: 'Password',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins Regular',
                            fontSize: screenHeight * 0.018));
                  }),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.020),
                        child: InkWell(
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: AppColors.unFocusPrimaryColor,
                                fontFamily: 'Poppins Medium',
                                fontSize: screenHeight * 0.017),
                          ),
                        ),
                      )
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
