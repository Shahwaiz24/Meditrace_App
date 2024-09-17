import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';

class PersonalInformationViewmodel with ChangeNotifier {
  bool isPrefixSelect = false;
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

  void selectGender({required String gender}) {
    isGenderSelect = true;
    if (gender != null) {
      SignUpGlobalData.finalGender = gender;
      print('Gender : ${SignUpGlobalData.finalPrefix}');
    }
    notifyListeners();
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
