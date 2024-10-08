import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/api_service.dart';
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
  String userId = "";

  bool isSetupLater = false;

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

  onSetupLaterOntap(
      {required BuildContext context,
   }) async {
    isStart = true;
    isUiFieldsFill = false;
    notifyListeners();
      final Map apiBody = {
      "firstname": SignUpGlobalData.finalFirstName,
      "lastname": SignUpGlobalData.finalLastName,
      "email": SignUpGlobalData.finalEmailAddress,
      "password": SignUpGlobalData.finalPassword,
      "phoneNumber": SignUpGlobalData.finalPhoneNumber,
      "gender": SignUpGlobalData.finalGender,
      "dateofbirth": SignUpGlobalData.finalDateOfBirth,
      "medicalInformation": {
        "bloodGroup": SignUpGlobalData.finalBloodGroup,
        "weight": SignUpGlobalData.finalWeight,
        "height": SignUpGlobalData.finalHeight,
        "known_Allergies": SignUpGlobalData.allergies,
        "chronic_Conditions": SignUpGlobalData.chronic
      },
      "emergency_Contact": SignUpGlobalData.emergencyContacts,
    };

    var jsonBody = jsonEncode(apiBody);

    bool apiRequest = await ApiService.signUpUser(body: apiBody);
     if (apiRequest == true) {
      isStart = false;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => SignupCompletedView(
                  userId: UserGlobalData.userId,
                  isError: false,
                )),
        (Route<dynamic> route) => false,
      );
    } else {
      isStart = false;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => SignupCompletedView(
                  userId: UserGlobalData.userId,
                  isError: true,
                )),
        (Route<dynamic> route) => false,
      );
    }
   
  }

  onContinueOntap({
    required BuildContext context,
    required String contactName,
    required String contactNumber,
    required bool isEnable,
    required String secondContactName,
    required String secondContactNumber,
  }) async {
    isStart = true;
    isUiFieldsFill = false;
    notifyListeners();
    bool validation = await validate(
        contactName: contactName,
        secondContactNumber: secondContactNumber,
        isEnable: isEnable,
        contactNumber: contactNumber,
        secondContactName: secondContactName);
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

      final Map apiBody = {
        "firstname": SignUpGlobalData.finalFirstName,
        "lastname": SignUpGlobalData.finalLastName,
        "email": SignUpGlobalData.finalEmailAddress,
        "password": SignUpGlobalData.finalPassword,
        "phoneNumber": SignUpGlobalData.finalPhoneNumber,
        "gender": SignUpGlobalData.finalGender,
        "dateofbirth": SignUpGlobalData.finalDateOfBirth,
        "medicalInformation": {
          "bloodGroup": SignUpGlobalData.finalBloodGroup,
          "weight": SignUpGlobalData.finalWeight,
          "height": SignUpGlobalData.finalHeight,
          "known_Allergies": SignUpGlobalData.allergies,
          "chronic_Conditions": SignUpGlobalData.chronic
        },
        "emergency_Contact": SignUpGlobalData.emergencyContacts,
      };

      var jsonBody = jsonEncode(apiBody);

      bool apiRequest = await ApiService.signUpUser(body: apiBody);
      if (apiRequest == true) {
        isStart = false;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => SignupCompletedView(
                    userId: UserGlobalData.userId,
                    isError: false,
                  )),
          (Route<dynamic> route) => false,
        );
      } else {
        isStart = false;
         Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => SignupCompletedView(
                    userId: UserGlobalData.userId,
                    isError: true,
                  )),
          (Route<dynamic> route) => false,
        );
      }
    } else if (validation == true && isEnable != true) {
      Map<String, dynamic> contact = {
        "contact_name": contactName,
        "contact_number": formattedNumber,
      };
      SignUpGlobalData.emergencyContacts.add(contact);
      final Map apiBody = {
        "firstname": SignUpGlobalData.finalFirstName,
        "lastname": SignUpGlobalData.finalLastName,
        "email": SignUpGlobalData.finalEmailAddress,
        "password": SignUpGlobalData.finalPassword,
        "phoneNumber": SignUpGlobalData.finalPhoneNumber,
        "gender": SignUpGlobalData.finalGender,
        "dateofbirth": SignUpGlobalData.finalDateOfBirth,
        "medicalInformation": {
          "bloodGroup": SignUpGlobalData.finalBloodGroup,
          "weight": SignUpGlobalData.finalWeight,
          "height": SignUpGlobalData.finalHeight,
          "known_Allergies": SignUpGlobalData.allergies,
          "chronic_Conditions": SignUpGlobalData.chronic
        },
        "emergency_Contact": SignUpGlobalData.emergencyContacts,
      };

      var jsonBody = jsonEncode(apiBody);

      bool apiRequest = await ApiService.signUpUser(body: apiBody);
         if (apiRequest == true) {
        isStart = false;
          isContactNameFocus = false;
        isContactNameNotEmpty = false;
        isContactNumberFocus = false;
        isContactNumberNotEmpty = false;
        onSecondContactNameFocus = false;
        onSecondContactNumberFocus = false;
        isSecondContactNameNotEmpty = false;
        isSecondContactNumberNotEmpty = false;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => SignupCompletedView(
                    userId: UserGlobalData.userId,
                    isError: false,
                  )),
          (Route<dynamic> route) => false,
        );
      } else {
        isStart = false;
          isContactNameFocus = false;
        isContactNameNotEmpty = false;
        isContactNumberFocus = false;
        isContactNumberNotEmpty = false;
        onSecondContactNameFocus = false;
        onSecondContactNumberFocus = false;
        isSecondContactNameNotEmpty = false;
        isSecondContactNumberNotEmpty = false;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => SignupCompletedView(
                    userId: UserGlobalData.userId,
                    isError: true,
                  )),
          (Route<dynamic> route) => false,
        );
      }
    }
    else{
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
       await Future.delayed(Duration(milliseconds: 1500));
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
