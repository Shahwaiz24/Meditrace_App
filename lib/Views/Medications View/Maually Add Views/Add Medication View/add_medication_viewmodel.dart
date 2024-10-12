import 'package:flutter/material.dart';

class AddMedicationViewmodel with ChangeNotifier {
  bool isNameNotEmpty = false;
  bool isStrengthNotEmpty = false;
  bool isNameFocus = false;
  bool isStrengthFocus = false;
  bool isUnitSelect = false;
  String selectedUnit = "";

  void selectUnit({required String unit}) {
    isUnitSelect = true;
    if (unit != null) {
      selectedUnit = unit;
      print('Unit : ${unit}');
    }
    notifyListeners();
  }

  onNameFocus({required bool focus}) {
    isNameFocus = focus;
    notifyListeners();
  }

  onStrengthFocus({required bool focus}) {
    isStrengthFocus = focus;
    notifyListeners();
  }

  isNameEmptyCheck({required String name}) {
    if (name.isNotEmpty && name != null) {
      isNameNotEmpty = true;
      notifyListeners();
    } else {
      isNameNotEmpty = false;
      notifyListeners();
    }
  }

  isStrengthEmptyCheck({required String strength}) {
    if (strength.isNotEmpty && strength != null) {
      isStrengthNotEmpty = true;
      notifyListeners();
    } else {
      isStrengthNotEmpty = false;
      notifyListeners();
    }
  }
}
