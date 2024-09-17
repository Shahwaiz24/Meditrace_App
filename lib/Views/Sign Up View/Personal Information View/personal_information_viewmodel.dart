import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Medical%20Information%20SignUp%20View/medical_information_signUp.dart';

class PersonalInformationViewmodel with ChangeNotifier {
  bool isPrefixSelect = false;
  bool isUiFieldsFill = false;
  bool isGenderSelect = false;
  bool isBirthDatePicked = false;
  bool isFirstNameError = false;
  bool isFocusFirstName = false;
  bool isLastNameNotEmpty = false;
  bool isFocusLastName = false;
  bool isFirstNameNotEmpty = false;

  onDateSelect({required String date}) {
    isBirthDatePicked = true;
    SignUpGlobalData.finalDateOfBirth = date;
    notifyListeners();
  }

  next({required BuildContext context}) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MedicalInformationSignupView()));
  }

  checkallFields(
      {required String firstName,
      required String lastName,
      required String prefix,
      required String gender,
      required String dateOfBirth}) {
    if ((firstName.isNotEmpty) &&
        (lastName.isNotEmpty) &&
        (prefix.isNotEmpty) &&
        (gender.isNotEmpty) &&
        (dateOfBirth.isNotEmpty)) {
      isUiFieldsFill = true;
      notifyListeners();
    } else {
      isUiFieldsFill = false;
      notifyListeners();
    }
  }

  void selectGender({required String gender}) {
    isGenderSelect = true;
    if (gender != null) {
      SignUpGlobalData.finalGender = gender;
      print('Gender : ${SignUpGlobalData.finalGender}');
      notifyListeners();
    }
  }

  void selectPrefix({required String prefix}) {
    isPrefixSelect = true;
    if (prefix != null) {
      SignUpGlobalData.finalPrefix = prefix;
      print('Prefix : ${SignUpGlobalData.finalPrefix}');
    }
    notifyListeners();
  }

  void onFirstNameFocusChange(bool hasFocus) {
    isFocusFirstName = hasFocus;

    notifyListeners();
  }

  void onLastNameFocusChange(bool hasFocus) {
    isFocusLastName = hasFocus;

    notifyListeners();
  }

  void checkFirstNameEmpty({required String firstName}) {
    if (firstName.isNotEmpty) {
      SignUpGlobalData.finalFirstName = firstName;
      isFirstNameNotEmpty = true;
      print(
          "First Name : ${SignUpGlobalData.finalFirstName} | Bool : ${isFirstNameNotEmpty}");
      notifyListeners();
    } else {
      SignUpGlobalData.finalFirstName = firstName;
      isFirstNameNotEmpty = false;
      print(
          "First Name : ${SignUpGlobalData.finalFirstName} | Bool : ${isFirstNameNotEmpty}");
      notifyListeners();
    }
  }

  void checkLastNameEmpty({required String lastName}) {
    if (lastName.isNotEmpty) {
      isLastNameNotEmpty = true;
      SignUpGlobalData.finalLastName = lastName;
      print(
          "Last Name : ${SignUpGlobalData.finalLastName} | Bool : ${isLastNameNotEmpty}");
      notifyListeners();
    } else {
      isLastNameNotEmpty = false;
      SignUpGlobalData.finalLastName = lastName;
      notifyListeners();
    }
  }
}
