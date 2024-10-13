import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Home%20View/home_view.dart';

// This is The Medicatiob Adding View model //

class AddMedicationViewmodel with ChangeNotifier {
  bool isNameNotEmpty = false;
  bool isStrengthNotEmpty = false;
  bool isNameFocus = false;
  bool isStrengthFocus = false;
  bool isUnitSelect = false;
  String selectedUnit = "";
  bool isFieldsFill = false;
  bool isError = false;

  navigateToBack({required BuildContext context}) {
    isNameNotEmpty = false;
    isStrengthNotEmpty = false;
    isNameFocus = false;
    isStrengthFocus = false;
    selectedUnit = "";
    isUnitSelect = false;
    isError = false;
    isFieldsFill = false;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeView()));
  }

  next({
    required String name,
    required String strength,
    required String unit,
  }) {
    isFieldsFill = false;
    notifyListeners();
    try {
      var number = double.tryParse(strength);
      if ((name.isNotEmpty) &&
          (strength.isNotEmpty) &&
          (unit.isNotEmpty) &&
          (number != null)) {
        MedicineAddingData.medicinesName = name;
        MedicineAddingData.medicinesStrength = strength;
        MedicineAddingData.medicinesUnit = unit;
        print(
            "Medications Second Screen Navigation | Runtime Type  : ${number.runtimeType}");
      } else {
        isError = true;
        isNameNotEmpty = false;
        isStrengthNotEmpty = false;
        isUnitSelect = false;
        notifyListeners();
      }
    } on Exception catch (e) {
      print("Error : ${e.toString()}");
      isError = true;
      isNameNotEmpty = false;
      isStrengthNotEmpty = false;
      isUnitSelect = false;
      notifyListeners();
    }
  }

  checkallFields({
    required String name,
    required String strength,
    required String unit,
  }) {
    if ((name.isNotEmpty) && (strength.isNotEmpty) && (unit.isNotEmpty)) {
      isFieldsFill = true;
      notifyListeners();
    } else {
      isFieldsFill = false;
      notifyListeners();
    }
  }

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
