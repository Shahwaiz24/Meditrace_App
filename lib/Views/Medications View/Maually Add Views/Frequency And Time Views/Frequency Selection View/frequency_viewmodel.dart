import 'package:flutter/material.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Selection%20View/selection_view.dart';

class FrequencyViewmodel with ChangeNotifier {
  bool isSelected = false;
  bool isEverday = false;
  bool isSpecific = false;
  bool isAsNeeded = false;
  List<String> selectedDays = ['Mon', 'Tue', 'Wed', 'Thr', 'Fri'];

  void pickDay(String day) {
    // Check if the day is already selected
    if (selectedDays.contains(day)) {
      // If the day is selected and there are more than one day, remove it
      if (selectedDays.length > 1) {
        selectedDays.remove(day);
        print("Day Tap : ${day} | Selected Days : ${selectedDays} ");
      }
    } else {
      // If the day is not in the list, add it
      selectedDays.add(day);
      print("Day Tap : ${day} | Selected Days : ${selectedDays} ");
    }

    // Notify listeners after the operation
    print("Selected Day Length : ${selectedDays.length}");
    notifyListeners();
  }

  navigateToPop({required BuildContext context}) {
    isSelected = false;
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const SelectionView()));
  }

  ontap({required String whichField}) {
    if (whichField == "everyday") {
      isSpecific = false;
      isAsNeeded = false;
      isEverday = true;
      notifyListeners();
    } else if (whichField == "specific") {
      isSpecific = true;
      isAsNeeded = false;
      isEverday = false;
      notifyListeners();
    } else {
      isSpecific = false;
      isAsNeeded = true;
      isEverday = false;
      notifyListeners();
    }
  }

  checkallfields() {
    if ((isEverday == true) || (isSpecific == true) || (isAsNeeded == true)) {
      isSelected = true;
      notifyListeners();
    } else {
      isSelected = false;
      notifyListeners();
    }
  }
}
