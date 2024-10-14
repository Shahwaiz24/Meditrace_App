import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Selection%20View/selection_view.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Selection%20View/selection_viewmodel.dart';

class FrequencyViewmodel with ChangeNotifier {
  bool isSelected = false;
  bool isEverday = false;
  bool isSpecific = false;
  bool isAsNeeded = false;
  List<String> selectedDays = ['Mon', 'Tue', 'Wed', 'Thr', 'Fri'];

  nextTap({required BuildContext context}) {
    if (isSpecific == true) {
      isSelected = false;
      isEverday = false;
      isSpecific = false;
      isAsNeeded = false;
      selectedDays = ['Mon', 'Tue', 'Wed', 'Thr', 'Fri'];
      SelectionViewmodel.isFrequencyCompleted = true;

      MedicineAddingData.isAsNeeded = false;
      MedicineAddingData.isEverday = false;

      MedicineAddingData.isSpecific = true;
      MedicineAddingData.specificDays = selectedDays;

      print(
          "Selected Days : ${MedicineAddingData.specificDays} | Specific : ${MedicineAddingData.isSpecific}");

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SelectionView(
                    isAsNeeded: false,
                    isEverday: false,
                    isSpecific: true,
                  )));
    } else if (isEverday == true) {
      isSelected = false;
      isEverday = false;
      isSpecific = false;
      isAsNeeded = false;
      selectedDays = ['Mon', 'Tue', 'Wed', 'Thr', 'Fri'];
      MedicineAddingData.isAsNeeded = false;
      MedicineAddingData.isEverday = true;
      SelectionViewmodel.isFrequencyCompleted = true;

      MedicineAddingData.isSpecific = false;
      print("Everyday : ${MedicineAddingData.isEverday}");

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SelectionView(
                    isAsNeeded: false,
                    isEverday: true,
                    isSpecific: false,
                  )));
    } else {
      isSelected = false;
      isEverday = false;
      isSpecific = false;
      isAsNeeded = false;
      selectedDays = ['Mon', 'Tue', 'Wed', 'Thr', 'Fri'];
      MedicineAddingData.isAsNeeded = true;
      MedicineAddingData.isEverday = false;
      SelectionViewmodel.isFrequencyCompleted = true;
      MedicineAddingData.isSpecific = false;
      print("Needed : ${MedicineAddingData.isAsNeeded}");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SelectionView(
                    isAsNeeded: true,
                    isEverday: false,
                    isSpecific: false,
                  )));
    }
  }

  void pickDay(String day) {
    if (selectedDays.contains(day)) {
      if (selectedDays.length > 1) {
        selectedDays.remove(day);
        print("Day Tap : ${day} | Selected Days : ${selectedDays} ");
      }
    } else {
      selectedDays.add(day);
      print("Day Tap : ${day} | Selected Days : ${selectedDays} ");
    }

    // Notify listeners after the operation
    print("Selected Day Length : ${selectedDays.length}");
    notifyListeners();
  }

  navigateToPop({required BuildContext context}) {
    isSelected = false;
    isEverday = false;
    isSpecific = false;
    SelectionViewmodel.isFrequencyCompleted = false;
    isAsNeeded = false;
    selectedDays = ['Mon', 'Tue', 'Wed', 'Thr', 'Fri'];
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const SelectionView(
                  isAsNeeded: false,
                  isEverday: false,
                  isSpecific: false,
                )));
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
