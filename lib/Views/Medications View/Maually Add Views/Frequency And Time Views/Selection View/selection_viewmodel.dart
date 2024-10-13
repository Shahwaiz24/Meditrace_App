import 'package:flutter/material.dart';

class SelectionViewmodel with ChangeNotifier {
  bool isFieldsFill = false;

  static bool isFrequencyCompleted = false;
  static bool isTimeCompleted = false;
  static bool isStartingDateCompleted = false;

  next({required BuildContext context}) {
    print("Next Function Started Wokring");
  }

  frequency({required BuildContext context}) {
    isFieldsFill = false;
    // Navigating To Frequency Screen //
  }

  checkFields({required BuildContext context}) {
    if ((isFrequencyCompleted == true) &&
        (isStartingDateCompleted == true) &&
        (isTimeCompleted == true)) {
      isFieldsFill = true;
      notifyListeners();
    } else {
      isFieldsFill = false;
      notifyListeners();
    }
  }
}
