import 'package:flutter/material.dart';
import 'package:meditrace_project/Views/Home%20View/home_view.dart';
import 'package:meditrace_project/Views/Splash%20View/splash_view.dart';

class SignupCompletedViewmodel with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;

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

  onTryAgainTap({required BuildContext context}) {
    isError = false;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SplashView()),
      (Route<dynamic> route) => false,
    );
  }
}
