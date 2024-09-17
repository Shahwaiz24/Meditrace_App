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
  String Selectedgender = '';
  String Selectedprefix = '';
  String SelectedBirth = '';

  onDateSelect({required String date}) {
    isBirthDatePicked = true;
    SelectedBirth = date;
    notifyListeners();
  }

  next(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required String Gender,
      required String Prefix,
      required String Birthdate}) {
    SignUpGlobalData.finalFirstName = firstName;
    SignUpGlobalData.finalLastName = lastName;
    SignUpGlobalData.finalDateOfBirth = Birthdate;
    SignUpGlobalData.finalGender = Gender;
    SignUpGlobalData.finalPrefix = Prefix;

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MedicalInformationSignupView()));
  }

  checkallFields({
    required String firstName,
    required String lastName,
  }) {
    if ((firstName.isNotEmpty) &&
        (lastName.isNotEmpty) &&
        (Selectedprefix.isNotEmpty) &&
        (Selectedgender.isNotEmpty) &&
        (SelectedBirth.isNotEmpty)) {
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
      Selectedgender = gender;
      print('Gender : $Selectedgender}');
      notifyListeners();
    }
  }

  void selectPrefix({required String prefix}) {
    isPrefixSelect = true;
    if (prefix != null) {
      Selectedprefix = prefix;
      print('Prefix : ${Selectedprefix}');
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
      isFirstNameNotEmpty = true;
      print("First Name : ${firstName} | Bool : ${isFirstNameNotEmpty}");
      notifyListeners();
    } else {
      isFirstNameNotEmpty = false;
      print("First Name : ${firstName} | Bool : ${isFirstNameNotEmpty}");
      notifyListeners();
    }
  }

  void checkLastNameEmpty({required String lastName}) {
    if (lastName.isNotEmpty) {
      isLastNameNotEmpty = true;
      print("Last Name : ${lastName} | Bool : ${isLastNameNotEmpty}");
      notifyListeners();
    } else {
      isLastNameNotEmpty = false;
      notifyListeners();
    }
  }
}
