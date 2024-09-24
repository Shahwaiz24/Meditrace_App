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

  validate(
      {required String contactName,
      required String secondContactNumber,
      required bool isEnable,
      required String contactNumber,
      required String secondContactName}) {
    try {
      if (isEnable == true) {
        final int firstNumber = int.parse(contactNumber);
        final int secondNumber = int.parse(secondContactNumber);
        if ((secondContactName.isNotEmpty) &&
            (contactNumber.isNotEmpty && contactNumber.length == 10) &&
            (secondContactNumber.isNotEmpty &&
                secondContactNumber.length == 10) &&
            (firstNumber != null && secondNumber != null)) {
          String cleanedNumberOne = contactNumber.replaceAll(' ', '');
          String cleanedNumberTwo = contactNumber.replaceAll(' ', '');

          // Check if the number already starts with +1, if not, add it
          if (!cleanedNumberOne.startsWith('+1') &&
              !cleanedNumberTwo.startsWith('+1')) {
            cleanedNumberOne = '+1' + cleanedNumberOne;
            cleanedNumberTwo = '+1' + cleanedNumberTwo;
          }

          // Ensure that the number contains exactly 11 digits after +1
          String digitsOnlyOne = cleanedNumberOne.replaceAll(RegExp(r'\D'), '');
          String digitsOnlyTwo = cleanedNumberTwo.replaceAll(RegExp(r'\D'), '');
          if (digitsOnlyOne.length != 11 && digitsOnlyTwo.length != 11) {
            return false;
          } else {
            firstContactNumberFormatted =
                '+1 ${digitsOnlyOne.substring(1, 4)} ${digitsOnlyOne.substring(4, 7)} ${digitsOnlyOne.substring(7, 11)}';

            firstContactNumberFormatted =
                '+1 ${digitsOnlyTwo.substring(1, 4)} ${digitsOnlyTwo.substring(4, 7)} ${digitsOnlyTwo.substring(7, 11)}';
            return true;
          }
        }
      } else {
        final int number = int.parse(contactNumber);
        if ((contactName.isNotEmpty) &&
            (contactNumber.isNotEmpty && contactNumber.length == 10) &&
            (number != null)) {
          String cleanedNumber = contactNumber.replaceAll(' ', '');

          // Check if the number already starts with +1, if not, add it
          if (!cleanedNumber.startsWith('+1')) {
            cleanedNumber = '+1' + cleanedNumber;
          }

          // Ensure that the number contains exactly 11 digits after +1
          String digitsOnly = cleanedNumber.replaceAll(
              RegExp(r'\D'), ''); // Remove non-digit characters
          if (digitsOnly.length != 11) {
            return false;
          } else {
            formattedNumber =
                '+1 ${digitsOnly.substring(1, 4)} ${digitsOnly.substring(4, 7)} ${digitsOnly.substring(7, 11)}';
            return true;
          }
        } else {
          return false;
        }
      }
    } on Exception catch (e) {
      print('Erorr Parsing Number ${e}');

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
    } 
    else if(validation == true && isEnable != true){
       Map<String, dynamic> contact = {
        "contact_name": contactName,
        "contact_number": formattedNumber,
      };
            SignUpGlobalData.emergencyContacts.add(contact);


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
    }
    else {
      isStart = false;
      isUiFieldsFill = false;
      error = true;
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
