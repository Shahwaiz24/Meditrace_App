import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Sign%20Up%20Completed/signup_completed_view.dart';

class EmergencyContactViewmodel with ChangeNotifier {
  bool isContactNameFocus = false;
  bool isStart = false;
  bool isContactNumberFocus = false;
  bool isContactNameNotEmpty = false;
  String formattedNumber = '';
  bool isContactNumberNotEmpty = false;
  bool isUiFieldsFill = false;
  bool error = false;
  bool isSecondContactEnable = false;
  bool onSecondContactNameFocus = false;

  bool onSecondContactNumberFocus = false;
  bool isSecondContactNameNotEmpty = false;

  bool isSecondContactNumberNotEmpty = false;

  String firstContactNumberFormatted = '';
  String secondContactNumberFormatted = '';

  isSecondContactNameEmptyCheck({required String secondContactName}) {
    if (secondContactName.isNotEmpty) {
      isSecondContactNameNotEmpty = true;
      notifyListeners();
    } else {
      isSecondContactNameNotEmpty = false;
      notifyListeners();
    }
  }

  isSecondContactNumberEmptyCheck({required String secondContactNumber}) {
    if (secondContactNumber.isNotEmpty) {
      isSecondContactNumberNotEmpty = true;
      notifyListeners();
    } else {
      isSecondContactNumberNotEmpty = false;
      notifyListeners();
    }
  }

  onSecondEnable() {
    isSecondContactEnable = true;
    isUiFieldsFill = false;
    notifyListeners();
  }

  onSecondContactNameFocusChange({required bool focus}) {
    onSecondContactNameFocus = focus;
    notifyListeners();
  }

  onSecondContactNumberFocusChange({required bool focus}) {
    onSecondContactNumberFocus = focus;
    notifyListeners();
  }

  onContactNameFocus({required bool focus}) {
    isContactNameFocus = focus;
    notifyListeners();
  }

  onContactPhoneNumberFocus({required bool focus}) {
    isContactNumberFocus = focus;
    notifyListeners();
  }

  isContactNameEmptyCheck({required String contactName}) {
    if (contactName.isNotEmpty) {
      isContactNameNotEmpty = true;
      notifyListeners();
    } else {
      isContactNameNotEmpty = false;
      notifyListeners();
    }
  }

  isContactNumberEmptyCheck({required String contactNumber}) {
    if (contactNumber.isNotEmpty) {
      isContactNumberNotEmpty = true;
      notifyListeners();
    } else {
      isContactNumberNotEmpty = false;
      notifyListeners();
    }
  }

  validate({
    required String contactName,
    required String secondContactNumber,
    required bool isEnable,
    required String contactNumber,
    required String secondContactName,
  }) {
    try {
      if (isEnable == true) {
        if ((secondContactName.isNotEmpty) &&
            (contactNumber.isNotEmpty && contactNumber.length == 10) &&
            (secondContactNumber.isNotEmpty &&
                secondContactNumber.length == 10)) {
          // Clean the contact numbers by removing spaces
          String cleanedNumberOne = contactNumber.replaceAll(' ', '');
          String cleanedNumberTwo = secondContactNumber.replaceAll(' ', '');

          // Remove non-digit characters
          String digitsOnlyOne = cleanedNumberOne.replaceAll(RegExp(r'\D'), '');
          String digitsOnlyTwo = cleanedNumberTwo.replaceAll(RegExp(r'\D'), '');

          // Check for leading zeros and ensure the number has 10 digits
          if (digitsOnlyOne.startsWith('0') || digitsOnlyTwo.startsWith('0')) {
            return false; // Leading zero found
          }

          if (digitsOnlyOne.length != 10 || digitsOnlyTwo.length != 10) {
            return false; // Must have exactly 10 digits
          }

          // Format the numbers as +1 XXX XXX XXXX
          firstContactNumberFormatted =
              '+1 ${digitsOnlyOne.substring(0, 3)} ${digitsOnlyOne.substring(3, 6)} ${digitsOnlyOne.substring(6, 10)}';

          secondContactNumberFormatted =
              '+1 ${digitsOnlyTwo.substring(0, 3)} ${digitsOnlyTwo.substring(3, 6)} ${digitsOnlyTwo.substring(6, 10)}';

          return true; // Both numbers are valid
        }
      } else {
        if (contactName.isNotEmpty &&
            contactNumber.isNotEmpty &&
            contactNumber.length == 10) {
          // Clean the contact number by removing spaces
          String cleanedNumber = contactNumber.replaceAll(' ', '');

          // Remove non-digit characters
          String digitsOnly = cleanedNumber.replaceAll(RegExp(r'\D'), '');

          // Check for leading zero and ensure the number has 10 digits
          if (digitsOnly.startsWith('0')) {
            return false; // Leading zero found
          }

          if (digitsOnly.length != 10) {
            return false; // Must have exactly 10 digits
          }

          // Format the number as +1 XXX XXX XXXX
          formattedNumber =
              '+1 ${digitsOnly.substring(0, 3)} ${digitsOnly.substring(3, 6)} ${digitsOnly.substring(6, 10)}';

          return true; // Valid number
        } else {
          return false; // Invalid input data
        }
      }
    } on Exception catch (e) {
      print('Error Parsing Number: $e');
      return false;
    }
  }

  onSetupLater({required BuildContext context}) {
    isStart = true;
    isUiFieldsFill = false;
    notifyListeners();
    print("Api Working Started");

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => const SignupCompletedView(
                isError: false,
              )),
      (Route<dynamic> route) => false,
    );
  }

  nextOntap(
      {required String contactName,
      required String contactNumber,
      required bool isEnable,
      required String secondContactName,
      required String secondContactNumber,
      required BuildContext context}) async {
    isStart = true;

    notifyListeners();
    bool validation = await validate(
        contactName: contactName,
        contactNumber: contactNumber,
        secondContactName: secondContactName,
        secondContactNumber: secondContactNumber,
        isEnable: isEnable);
    if (validation == true && isEnable == true) {
      Map<String, dynamic> firstContact = {
        "contact_name": contactName,
        "contact_number": firstContactNumberFormatted,
      };

      Map<String, dynamic> SecondContact = {
        "contact_name": secondContactName,
        "contact_number": secondContactNumberFormatted,
      };
      SignUpGlobalData.emergencyContacts.add(firstContact);
      SignUpGlobalData.emergencyContacts.add(SecondContact);

      print(
          'First Number : ${firstContactNumberFormatted} | Second Number : ${secondContactNumberFormatted}');

      print('Api Work Here for 2 Emergency Contacts');
      print('Sign Up Completed');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const SignupCompletedView(
                  isError: true,
                )),
        (Route<dynamic> route) => false,
      );

      isUiFieldsFill = false;
      isStart = false;

      notifyListeners();
    } else if (validation == true && isEnable != true) {
      Map<String, dynamic> contact = {
        "contact_name": contactName,
        "contact_number": formattedNumber,
      };
      SignUpGlobalData.emergencyContacts.add(contact);
      print('Number Formated : ${formattedNumber}');

      print('Api Work Here for One Emergency Contact');
      print('Sign Up Completed');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const SignupCompletedView(
                  isError: true,
                )),
        (Route<dynamic> route) => false,
      );

      isUiFieldsFill = false;
      isStart = false;

      notifyListeners();
    } else {
      isStart = false;
      isUiFieldsFill = false;
      error = true;
      isContactNameFocus = false;
      isContactNameNotEmpty = false;
      isContactNumberFocus = false;
      isContactNumberNotEmpty = false;
      onSecondContactNameFocus = false;
      onSecondContactNumberFocus = false;
      isSecondContactNameNotEmpty = false;
      isSecondContactNumberNotEmpty = false;
      notifyListeners();
      await Future.delayed(Duration(seconds: 4));
      error = false;
      notifyListeners();
    }
  }

  checkallFields(
      {required String contactName,
      required String contactNumber,
      required bool isEnable,
      required String secondContactNumber,
      required String secondContactName}) {
    isUiFieldsFill = false;
    notifyListeners();
    if ((contactName != null && contactName.isNotEmpty) &&
        (contactNumber != null &&
            contactNumber.isNotEmpty &&
            contactNumber.length == 10)) {
      if (isEnable == true) {
        if ((isEnable == true) &&
            (secondContactName != null && secondContactName.isNotEmpty) &&
            (secondContactNumber != null &&
                secondContactNumber.isNotEmpty &&
                secondContactNumber.length == 10)) {
          isUiFieldsFill = true;
          print(
              " Bool : ${isUiFieldsFill} | Contact Name : ${contactName} | Number : ${contactNumber}, Second Name | ${secondContactName} | Second Number : ${secondContactNumber}");
        } else {
          isUiFieldsFill = false;
          print(
              " Bool : ${isUiFieldsFill} | Contact Name : ${contactName} | Number : ${contactNumber}, Second Name | ${secondContactName} | Second Number : ${secondContactNumber}");
        }
      } else {
        isUiFieldsFill = true;
        print(
            " Bool : ${isUiFieldsFill} | Contact Name : ${contactName} | Number : ${contactNumber}, Second Name | ${secondContactName} | Second Number : ${secondContactNumber}");
      }

      notifyListeners();
    } else {
      isUiFieldsFill = false;
      print(
          " Bool : ${isUiFieldsFill} | Contact Name : ${contactName} | Number : ${contactNumber}");

      notifyListeners();
    }
  }
}
