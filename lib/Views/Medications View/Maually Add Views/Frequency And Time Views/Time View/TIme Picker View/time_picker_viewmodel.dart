import 'package:flutter/material.dart';

class TimePickerViewmodel with ChangeNotifier {
  int _selectedHour = 12;
  int _selectedMinute = 00;
  String _selectedPeriod = "AM";

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
}
