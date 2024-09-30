import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Home%20View/home_view.dart';
import 'package:meditrace_project/Views/Splash%20View/splash_view.dart';

class SignupCompletedViewmodel with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  bool isvisible = false;

  void start() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    isvisible = true;
    notifyListeners();
  }

  onContinueOntap(
      {required BuildContext context,
      required bool isSetupLater,
      required String userFirstName,
      required String userLastName,
      required String userEmailAddress,
      required String userPhoneNumber,
      required String userGender,
      required String userPrefix,
      required String userDateofBirth,
      required String userPassword,
      required String userBloodGroup,
      required String userHeight,
      required String userWeight,
      required List userKnownAllergies,
      required List userChronicCondition,
      required List userEmergency}) async {
    if (isSetupLater == true) {
      isLoading = true;
      notifyListeners();
// Api Work Here and Navigation if Has Error then isError = true and then NotifyListner
      await Future.delayed(Duration(seconds: 4));
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = true;
      notifyListeners();
      // Api Work Here and Navigatio n if Has Error then isError = true and then NotifyListner
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
        (Route<dynamic> route) => false,
      );
    }
  }



  Widget animatedWidget(
      {required BuildContext context,
      required bool isError,
      required double screenHeight,
      required double screenWidth}) {
    return AnimatedOpacity(
      opacity: isvisible ? 1.0 : 0.0,
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
                    "Your Profile Setup Not\n             Completed!",
                    style: TextStyle(
                        color: AppColors.TextblackColor,
                        fontFamily: "Poppins Bold",
                        fontSize: screenHeight * 0.025),
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Text(
                    'An Error Occured While Creating\n                 Your Profile.',
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
                    image:
                        AssetImage('assets/images/signUp_completed_image.png'),
                  ),
                  Text(
                    "Your Profile Setup has\n      been Completed!",
                    style: TextStyle(
                        color: AppColors.TextblackColor,
                        fontFamily: "Poppins Bold",
                        fontSize: screenHeight * 0.025),
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Text(
                    '       Your profile has been successfully\n completed! You\'re all set to start exploring!',
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
                        // model.onContinueOntap(
                        //     context: context,
                        //     isSetupLater: false,
                        //     userFirstName: SignUpGlobalData.finalFirstName,
                        //     userLastName: SignUpGlobalData.finalLastName,
                        //     userEmailAddress:
                        //         SignUpGlobalData.finalEmailAddress,
                        //     userPhoneNumber:
                        //         SignUpGlobalData.finalPhoneNumber,
                        //     userGender: SignUpGlobalData.finalGender,
                        //     userPrefix: SignUpGlobalData.finalPrefix,
                        //     userDateofBirth:
                        //         SignUpGlobalData.finalDateOfBirth,
                        //     userPassword: SignUpGlobalData.finalPassword,
                        //     userBloodGroup: SignUpGlobalData.finalBloodGroup,
                        //     userHeight: SignUpGlobalData.finalHeight,
                        //     userWeight: SignUpGlobalData.finalWeight,
                        //     userKnownAllergies: SignUpGlobalData.allergies,
                        //     userChronicCondition: SignUpGlobalData.chronic,
                        //     userEmergency: [
                        //       {
                        //         "Contact Name": SignUpGlobalData.contactName,
                        //         "Contact Number":
                        //             SignUpGlobalData.contactNumber
                        //       }
                        //     ]);
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
            ),
    );
  }

  onTryAgainTap({required BuildContext context}) {
    isError = false;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SplashView()),
      (Route<dynamic> route) => false,
    );
  }
}
