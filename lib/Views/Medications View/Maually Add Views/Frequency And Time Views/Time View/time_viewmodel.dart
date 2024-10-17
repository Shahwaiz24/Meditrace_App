import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Frequency%20Selection%20View/frequency_view.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Selection%20View/selection_view.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Selection%20View/selection_viewmodel.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Time%20View/TIme%20Picker%20View/time_picker_view.dart';

class TimeViewmodel with ChangeNotifier {
  static bool isDose1Selected = false;
  static bool isDose2Selected = false;
  bool isSecondDoseEnable = false;
  bool isFieldFill = false;

  initCheck() {
    if ((isDose1Selected == true) && (isSecondDoseEnable == false)) {
      isFieldFill = true;
    } else if ((isDose1Selected == true) &&
        (isSecondDoseEnable == true) &&
        (isDose2Selected == true)) {
      isFieldFill = true;
    } else {
      isFieldFill = false;
    }
  }

  selectDose1({required BuildContext context}) {
    isDose1Selected = false;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const TimePickerView(
                  isSecond: false,
                )));
  }

  selectDose2({required BuildContext context}) {
    isDose2Selected = false;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const TimePickerView(
                  isSecond: true,
                )));
  }

  addDose2() {
    isSecondDoseEnable = true;
    notifyListeners();
  }

  navigatetoBack({required BuildContext context, required bool isPop}) {
    if (isPop == true) {
      isDose1Selected = false;
      isDose2Selected = false;
      isSecondDoseEnable = false;
      SelectionViewmodel.isTimeCompleted = false;
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => SelectionView(
                  isAsNeeded: MedicineAddingData.isAsNeeded,
                  isEverday: MedicineAddingData.isEverday,
                  isSpecific: MedicineAddingData.isSpecific,
                )),
      );
    } else {
      isDose1Selected = false;
      isDose2Selected = false;
      isSecondDoseEnable = false;
      SelectionViewmodel.isTimeCompleted = true;
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => SelectionView(
                  isAsNeeded: MedicineAddingData.isAsNeeded,
                  isEverday: MedicineAddingData.isEverday,
                  isSpecific: MedicineAddingData.isSpecific,
                )),
      );
    }
  }
}
