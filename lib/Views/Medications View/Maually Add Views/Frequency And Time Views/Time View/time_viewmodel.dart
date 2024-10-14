import 'package:flutter/material.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Time%20View/TIme%20Picker%20View/time_picker_view.dart';

class TimeViewmodel with ChangeNotifier {
  bool isDose1Selected = false;
  bool isDose2Selected = false;

  selectDose1({required BuildContext context}) {
    isDose1Selected = false;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => TimePickerView(Onchanged: (value) {
                  print("Time : ${value}");
                })));
  }
}
