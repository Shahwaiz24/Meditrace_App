// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Emergency%20Contact%20View/emergency_contact_view.dart';

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
      print(
          'Boolean : ${isUiFieldsFill} | Chronic : ${chronic} | Allergies : ${allergies} | Height : ${height} | Weight : ${weight} | Blood Group : ${bloodGroup}');

      isUiFieldsFill = true;

      notifyListeners();
    } else {
      print(
          'Boolean : ${isUiFieldsFill} | Chronic : ${chronic} | Allergies : ${allergies} | Height : ${height} | Weight : ${weight} | Blood Group : ${bloodGroup}');
      isUiFieldsFill = false;
      notifyListeners();
    }
  }

  validation(
      {required List<String> chronic,
      required List<String> allergies,
      required String height,
      required String weight,
      required String bloodGroup}) {
    if ((chronic != null && chronic.isNotEmpty) &&
        (allergies != null && allergies.isNotEmpty) &&
        (height != null && height.isNotEmpty)) {
      return true;
    } else {
      return false;
    }
  }

  nextSignInFunction(
      {required List<String> chronic,
      required List<String> allergies,
      required String height,
      required String bloodGroup,
      required String weight,
      required BuildContext context}) async {
    isStart = true;

    notifyListeners();
    bool validate = await validation(
        weight: weight,
        height: height,
        chronic: chronic,
        allergies: allergies,
        bloodGroup: bloodGroup);
    if (validate == true) {
      print('Navigating and SuccessFully Login');

      SignUpGlobalData.allergies = allergies;
      SignUpGlobalData.chronic = chronic;
      SignUpGlobalData.finalBloodGroup = bloodGroup;
      SignUpGlobalData.finalHeight = height;
      SignUpGlobalData.finalWeight = weight;
      isUiFieldsFill = false;
      isStart = false;
      notifyListeners();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => EmergencyContactView()));
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

  onWeightChanged({required String weight}) {
    if (weight.isNotEmpty) {
      isWeightNotEmpty = true;
      notifyListeners();
    } else {
      isWeightNotEmpty = false;
      notifyListeners();
    }
  }

  onHeightChanged({required String height}) {
    if (height.isNotEmpty) {
      isHeightNotEmpty = true;
      notifyListeners();
    } else {
      isHeightNotEmpty = false;
      notifyListeners();
    }
  }
}
