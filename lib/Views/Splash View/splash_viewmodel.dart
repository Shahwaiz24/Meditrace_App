import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/app_logo.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/local_storage.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Home%20View/home_view.dart';
import 'package:meditrace_project/Views/Sign%20In%20View/signin_view.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/signup_view.dart';

class SplashViewmodel with ChangeNotifier {
  bool _animate = false;
  bool _showButtons = false;
  bool isCompleted = false;

  bool get animate => _animate;
  bool get showButtons => _showButtons;

  void startAnimation() {
    _animate = true;
    notifyListeners();
  }

  void navigating() async {
    print("Animation Reset");
    _animate = false;
    _showButtons = false;
    isCompleted = false;
  }

  void showNewColumn() {
    _showButtons = true;
    notifyListeners();
  }

  void animating({required BuildContext context}) async {
    if (isCompleted == false) {
      print("Animating Start Again ");
      isCompleted = true;

      await Future.delayed(const Duration(seconds: 3), () async {
        startAnimation();
        bool check = await LocalStorage.checkLogin();
        if (check == true) {
          print("Navigate to Home View");

          await Future.delayed(const Duration(seconds: 1));
          isCompleted = false;
          _animate = false;
          _showButtons = false;
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        } else {
          Future.delayed(const Duration(seconds: 1), () {
            showNewColumn();
          });
        }
      });
    } else {
      print("Already Completed");
    }
  }

  Widget buildAnimatedButtons({
    required double screenHeight,
    required BuildContext context,
    required double screenWidth,
    required bool animate,
    required bool showButtons,
  }) {
    return AnimatedPositioned(
      duration: const Duration(seconds: 1),
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: showButtons ? 1.0 : 0.0,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.080),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppLogo(
                  screenheight: screenHeight,
                  screenwidth: screenWidth,
                  imageHeight: 0.100,
                ),
                SizedBox(height: screenHeight * 0.020),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Medi',
                      style: TextStyle(
                        color: AppColors.AppTextColor1,
                        fontSize: screenHeight * 0.038,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Poppins Semi Bold',
                      ),
                    ),
                    Text(
                      'trace',
                      style: TextStyle(
                        color: AppColors.AppTextColor2,
                        fontSize: screenHeight * 0.038,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Poppins Semi Bold',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.040),
                InkWell(
                  onTap: () {
                    print('Navigating to Sign In');
                    navigating();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SigninView()));
                  },
                  child: ButtonComponent(
                    decoration: BoxDecoration(
                        color: AppColors.ButtonBackColor,
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.070,
                        )),
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    ButtonHeight: 0.070,
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: AppColors.TextwhiteColor,
                          fontFamily: "Poppins Semi Bold",
                          fontSize: screenHeight * 0.018,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.020),
                InkWell(
                  onTap: () {
                    print('Navigating to Sign Up');
                    navigating();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupView()));
                  },
                  child: ButtonComponent(
                    decoration: BoxDecoration(
                        color: AppColors.ButtonBackColor,
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.070,
                        )),
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    ButtonHeight: 0.070,
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.TextwhiteColor,
                          fontFamily: "Poppins Semi Bold",
                          fontSize: screenHeight * 0.018,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
