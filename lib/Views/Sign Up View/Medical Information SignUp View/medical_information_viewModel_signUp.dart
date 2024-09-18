import 'package:flutter/material.dart';

class MedicalInformationSignUpViewModel with ChangeNotifier {
  bool isFocusAllergies = false;
  bool isFocusChronic = false;
  bool isBloodGroupSelect = false;

  bool isFocusMedication = false;
  bool isFocusWeight = false;
  bool isFocusHeight = false;
  bool isError = false;
  bool isUiFieldsFill = false;
  bool isStart = false;
  String selectedBloodGroup = '';
  bool isWeightNotEmpty = false;
  bool isHeightNotEmpty = false;
  bool isChronicSelected = false;
  bool isAllergiesSelected = false;
  List<String> selectedChronicConditions = []; // List to hold selected items
  List<String> allChronicConditions = [
    "Cancer",
    "Cardiovascular Diseases",
    "Chronic Respiratory Diseases",
    "Diabetes",
    "Other"
  ]; // Full list oll list of dropdown items

  List<String> allAllergies = [
    "Food Allergies",
    "Pet Allergies",
    "Dust mites",
    "Molds",
    "Pollen",
    "Latex Allergies",
    "Insect Stings",
    "Medicines",
    "Other"
  ];
  List<String> selectedAllergies = [];

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
    if (field == "weight") {
      isFocusWeight = hasFocus;
      notifyListeners();
    } else if (field == "chronic") {
      isFocusChronic = hasFocus;
      notifyListeners();
    } else if (field == "allergies") {
      isFocusAllergies = hasFocus;
      notifyListeners();
    } else if (field == "height") {
      isFocusHeight = hasFocus;
      notifyListeners();
    }
  }

  onChangedFocusOFUi(
      {required List chronic,
      required List allergies,
      required String height,
      required String weight,
      required String bloodGroup}) {
    if ((chronic != null && chronic.isNotEmpty) &&
        (allergies != null && allergies.isNotEmpty) &&
        (height != null && height.isNotEmpty) &&
        (weight != null && weight.isNotEmpty) &&
        (bloodGroup.isNotEmpty)) {
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

  onBloodGroupSelect({required String bloodGroup}) {
    isBloodGroupSelect = true;
    selectedBloodGroup = bloodGroup;
    notifyListeners();
  }

  // Method to remove an item from the list (called when cancel icon is clicked)
  void removeChronicCondition(String condition) {
    selectedChronicConditions.remove(condition); // Remove the condition
    notifyListeners();
  }
  void removeAllergie(String condition) {
    selectedAllergies.remove(condition); // Remove the condition
    notifyListeners();
  }

  void onChronicSelect({required String condition}) {
    if (!selectedChronicConditions.contains(condition)) {
      selectedChronicConditions.add(condition);
      isChronicSelected = true;
      if (selectedChronicConditions.isEmpty) {
        isChronicSelected = false;
        notifyListeners();
      }
    } else {
      selectedChronicConditions.remove(condition);
      if (selectedChronicConditions.isEmpty) {
        isChronicSelected = false;
        notifyListeners();
      } // Deselect if already selected
    }

    notifyListeners();
  }

  bool isConditionSelected(String condition) {
    return selectedChronicConditions.contains(condition);
  }

  onAllergiesSelect({required String allergies}) {
    isAllergiesSelected = true;
     if (!selectedAllergies.contains(allergies)) {
      selectedAllergies.add(allergies);
      isAllergiesSelected = true;
      if (selectedAllergies.isEmpty) {
        isAllergiesSelected = false;
        notifyListeners();
      }
    } else {
      selectedAllergies.remove(allergies);
      if (selectedAllergies.isEmpty) {
        isAllergiesSelected = false;
        notifyListeners();
      } // Deselect if already selected
    }

    notifyListeners();
  }

  // Filter out selected items from the dropdown
  
  onWeightChanged({required String weight}) {}
}
