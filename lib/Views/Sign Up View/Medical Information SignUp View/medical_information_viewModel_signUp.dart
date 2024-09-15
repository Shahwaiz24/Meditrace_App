import 'package:flutter/material.dart';

class MedicalInformationSignUpViewModel with ChangeNotifier {
  bool isFocusAllergies = false;
  bool isFocusChronic = false;
  bool isFocusMedication = false;
  bool isError = false;
  bool isUiFieldsFill = false;
  bool isStart = false;
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

  onChangedFocusOFUi(
      {required String chronic,
      required String allergies,
      required String medication}) {
    if ((chronic != null && chronic.isNotEmpty) &&
        (allergies != null && allergies.isNotEmpty) &&
        (medication != null && medication.isNotEmpty)) {
      isUiFieldsFill = true;
      notifyListeners();
    } else {
      isUiFieldsFill = false;
      notifyListeners();
    }
  }

  validation(
      {required String chronic,
      required String allergies,
      required String medication}) {
    if ((chronic != null && chronic.isNotEmpty) &&
        (allergies != null && allergies.isNotEmpty) &&
        (medication != null && medication.isNotEmpty)) {
      return true;
    } else {
      return false;
    }
  }

  nextSignInFunction(
      {required String chronic,
      required String allergies,
      required String medication,
      required BuildContext context}) async {
    isStart = true;
    notifyListeners();
    bool validate = await validation(
        chronic: chronic, allergies: allergies, medication: medication);
    if (validate == true) {
      print('Navigating and SuccessFully Login');

      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => HomeView()));
      isStart = false;
      notifyListeners();
    } else {
      isStart = false;
      isError = true;
      isUiFieldsFill = false;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 3));
      isError = false;
      notifyListeners();
    }
  }
}
