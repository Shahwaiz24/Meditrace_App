import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/bottom_sheet.dart';

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
  bool allFieldFill = false;
  navigateToback({required BuildContext context}) {
    isFirstNameNotEmpty = false;
    isLastNameNotEmpty = false;
    isDateofBirthNotEmpty = false;
    isPhoneNotEmpty = false;
    allFieldFill = false;
    Navigator.pop(context);
  }

  void showCustomBottomSheet(BuildContext context,
      {required double screenHeight, required double screenWidth}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take full height
      backgroundColor: Colors.transparent, // To see the rounded corners effect
      builder: (context) => CustomBottomSheet(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

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

  void checkFields(
      {required String birth,
      required String firstName,
      required String lastName,
      required String email,
      required String phone}) {
    if ((birth.isNotEmpty) &&
        (firstName.isNotEmpty) &&
        (lastName.isNotEmpty) &&
        (email.isNotEmpty) &&
        (email.contains('@') && email.contains(".com")) &&
        (phone.isNotEmpty && phone.length == 10)) {
      allFieldFill = true;
      notifyListeners();
    } else {
      allFieldFill = false;
      notifyListeners();
    }
  }
}
