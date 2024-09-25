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
    isFocusLastName = hasFocus;

    notifyListeners();
  }

  void onEmailFocusChange(bool hasFocus) {
    isFocusEmail = hasFocus;

    notifyListeners();
  }

  void onPhoneFocusChange(bool hasFocus) {
    isFocusPhone = hasFocus;

    notifyListeners();
  }

  void onDateOfBirthFocusChange(bool hasFocus) {
    isFocusDateofBirth = hasFocus;

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
      print("Last Name : ${lastName} | Bool : ${isLastNameNotEmpty}");
      notifyListeners();
    }
  }

  void checkPhoneEmpty({required String phone}) {
    if (phone.isNotEmpty) {
      isPhoneNotEmpty = true;
      print("Phone Number : ${phone} | Bool : ${isPhoneNotEmpty}");
      notifyListeners();
    } else {
      isPhoneNotEmpty = true;
      print("Phone Number : ${phone} | Bool : ${isPhoneNotEmpty}");
      notifyListeners();
    }
  }

  void checkEmailEmpty({required String email}) {
    if (email.isNotEmpty) {
      isEmailNotEmpty = true;
      print("Email : ${email} | Bool : ${isEmailNotEmpty}");
      notifyListeners();
    } else {
      isEmailNotEmpty = true;
      print("Email : ${email} | Bool : ${isEmailNotEmpty}");
      notifyListeners();
    }
  }

  void checkdateBirthEmpty({required String birth}) {
    if (birth.isNotEmpty) {
      isDateofBirthNotEmpty = true;
      print("Email : ${birth} | Bool : ${isDateofBirthNotEmpty}");
      notifyListeners();
    } else {
      isDateofBirthNotEmpty = true;
      print("Email : ${birth} | Bool : ${isDateofBirthNotEmpty}");
      notifyListeners();
    }
  }
}
