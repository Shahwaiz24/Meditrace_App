import 'package:flutter/material.dart';

class MedicalInformationSignUpViewModel with ChangeNotifier {
  bool isFocusAllergies = false;
  bool isFocusChronic = false;
  bool isFocusMedication = false;
  bool isError = false;
  void onAllergiesFocusChange(bool hasFocus) {
    isFocusAllergies = hasFocus;

    notifyListeners();
  }

  void onChronicFocusChange(bool hasFocus) {
    isFocusChronic = hasFocus;

    notifyListeners();
  }

  void onMedicationFocusChange(bool hasFocus) {
    isFocusMedication = hasFocus;

    notifyListeners();
  }

  void onFocusChange(String field, bool hasFocus) {
    if (field == "allergies") {
      isFocusAllergies = hasFocus;
      notifyListeners();
    } else if (field == "chronic") {
      isFocusChronic = hasFocus;
      notifyListeners();
    } else if (field == "medication") {
      isFocusMedication = hasFocus;
      notifyListeners();
    }
  }
}
