import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Time%20View/time_view.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Time%20View/time_viewmodel.dart';

class TimePickerViewmodel with ChangeNotifier {
  int _selectedHour = 5;
  int _selectedMinute = 30;
  String _selectedPeriod = "AM";
  bool isFieldsFill = false;
  String finalTime = "";

  int get selectedHour => _selectedHour;
  int get selectedMinute => _selectedMinute;
  String get selectedPeriod => _selectedPeriod;

  void updateHour(int hour) {
    _selectedHour = hour;
    notifyListeners();
  }

  void updateMinute(int minute) {
    _selectedMinute = minute;
    notifyListeners();
  }

  void updatePeriod(String period) {
    _selectedPeriod = period;
    notifyListeners();
  }

  changedTime({required hour, required minute, required period}) async {
    if ((hour != null) && (minute != null) && (period != null)) {
      isFieldsFill = true;
      notifyListeners();
      finalTime = "${hour}:${minute} ${period}";
      print("Time : ${finalTime}");
    } else {
      isFieldsFill = false;
      notifyListeners();
    }
  }

  saveFunction({required BuildContext context, required bool second}) {
    if (finalTime != null && finalTime.isNotEmpty && second != true) {
      _selectedHour = 5;
      _selectedMinute = 30;
      _selectedPeriod = "AM";
      MedicineAddingData.dose1Time = finalTime;
      finalTime = "";
      isFieldsFill = false;
      notifyListeners();
      TimeViewmodel.isDose1Selected = true;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const TimeView()));
    } else if (finalTime != null && finalTime.isNotEmpty && second == true) {
      _selectedHour = 5;
      _selectedMinute = 30;
      _selectedPeriod = "AM";
      MedicineAddingData.dose2Time = finalTime;
      finalTime = "";
      isFieldsFill = false;
      notifyListeners();
      TimeViewmodel.isDose2Selected = true;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const TimeView()));
    } else {
      isFieldsFill = false;
      finalTime = "";
      _selectedHour = 5;
      _selectedMinute = 30;
      _selectedPeriod = "AM";
      notifyListeners();
    }
  }
}
