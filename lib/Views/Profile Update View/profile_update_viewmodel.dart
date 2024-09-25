import 'package:flutter/material.dart';

class ProfileUpdateViewmodel with ChangeNotifier {
  bool isFocusFirstName = false;
  bool isFocusLastName = false;
  bool isFocusEmail = false;
  bool isFocusPhone = false;
  bool isFocusDateofBirth = false;
  bool isFirstNameNotEmpty = false;
  bool isLastNameNotEmpty = false;
  bool isEmailNotEmpty = false;
  bool isPhoneNotEmpty = false;
  bool isDateofBirthNotEmpty = false;

  
  void onFirstNameFocusChange(bool hasFocus) {
    isFocusFirstName = hasFocus;

    notifyListeners();
  }
  
  void onFirstLastFocusChange(bool hasFocus) {
    isFocusFirstName = hasFocus;

    notifyListeners();
  }
  
  void onEmailFocusChange(bool hasFocus) {
    isFocusFirstName = hasFocus;

    notifyListeners();
  }
  
  void onPhoneFocusChange(bool hasFocus) {
    isFocusFirstName = hasFocus;

    notifyListeners();
  }
  
  void onDateOfBirthFocusChange(bool hasFocus) {
    isFocusFirstName = hasFocus;

    notifyListeners();
  }

}
