import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Splash%20View/splash_view.dart';

class PasswordChangedViewModel with ChangeNotifier {
  bool _isVisible = false;

  bool get isVisible => _isVisible;

  void showPage() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _isVisible = true;
    notifyListeners();
  }

  Widget animatedWidget(
      {required double screenHeight,
      required double screenWidth,
      required BuildContext context,
      required bool isError}) {
    return AnimatedOpacity(
        opacity: isVisible ? 1.0 : 0.0, // Visible based on state
        duration: const Duration(milliseconds: 500),
        child: isError == true
            ? Padding(
                padding: EdgeInsets.only(
                  bottom: screenHeight * 0.070,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Container(
                      child: const Stack(
                        alignment: Alignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/image_back.png'),
                          ),
                          Image(
                            image: AssetImage('assets/images/final_error.png'),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Password Not Changed!",
                      style: TextStyle(
                          color: AppColors.TextblackColor,
                          fontFamily: "Poppins Bold",
                          fontSize: screenHeight * 0.025),
                    ),
                    SizedBox(
                      height: screenHeight * 0.020,
                    ),
                    Text(
                      'An Error Occured While Changing\n                 Your Password.',
                      style: TextStyle(
                          color: AppColors.unFocusPrimaryColor,
                          fontSize: screenHeight * 0.020,
                          fontFamily: "Poppins Light"),
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.070),
                      child: InkWell(
                        onTap: () {
                          onTryAgainTap(context: context);
                        },
                        child: ButtonComponent(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          ButtonHeight: 0.075,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.080),
                              color: AppColors.PrimaryBlueColor),
                          child: Center(
                            child: Text(
                              'Try Again',
                              style: TextStyle(
                                  color: AppColors.TextwhiteColor,
                                  fontFamily: 'Poppins Semi Bold',
                                  fontSize: screenHeight * 0.020),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.only(
                  bottom: screenHeight * 0.070,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Image(
                      image: AssetImage(
                          'assets/images/signUp_completed_image.png'),
                    ),
                    Text(
                      "Password Changed!",
                      style: TextStyle(
                          color: AppColors.TextblackColor,
                          fontFamily: "Poppins Bold",
                          fontSize: screenHeight * 0.025),
                    ),
                    SizedBox(
                      height: screenHeight * 0.020,
                    ),
                    Text(
                      '   Your changes have been saved! You \n          can now start using the app',
                      style: TextStyle(
                          color: AppColors.unFocusPrimaryColor,
                          fontSize: screenHeight * 0.020,
                          fontFamily: "Poppins Light"),
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.070),
                      child: InkWell(
                        onTap: () {
                          print("Password Changed and Continue Tap");
                          onContineTap(context: context);
                        },
                        child: ButtonComponent(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          ButtonHeight: 0.075,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.080),
                              color: AppColors.PrimaryBlueColor),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  color: AppColors.TextwhiteColor,
                                  fontFamily: 'Poppins Semi Bold',
                                  fontSize: screenHeight * 0.020),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }

   onContineTap({required BuildContext context}) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(context,   MaterialPageRoute(builder: (context) => const SplashView()),);
  }

  onTryAgainTap({required BuildContext context}) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(context,   MaterialPageRoute(builder: (context) => const SplashView()),);
  
  }
}
