import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/app_logo.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/utils.dart';

class SplashViewmodel with ChangeNotifier {
  bool _animate = false;
  bool _showButtons = false;

  bool get animate => _animate;
  bool get showButtons => _showButtons;

  void startAnimation() {
    _animate = true;
    notifyListeners();
  }

  void showNewColumn() {
    _showButtons = true;
    notifyListeners();
  }

  void animating() async {
    await Future.delayed(const Duration(seconds: 4), () {
      startAnimation();
      // Delay before showing the new column with buttons
      Future.delayed(const Duration(seconds: 1), () {
        showNewColumn();
      });
    });
  }

  Widget buildAnimatedButtons({
    required double screenHeight,
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
                ButtonComponent(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  ButtonHeight: 0.070,
                  radius: 0.070,
                  backgroundColor: AppColors.ButtonBackColor,
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
                SizedBox(height: screenHeight * 0.020),
                ButtonComponent(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  ButtonHeight: 0.070,
                  radius: 0.070,
                  backgroundColor: AppColors.ButtonBackColor,
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
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
