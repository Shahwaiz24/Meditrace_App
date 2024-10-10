import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/api_service.dart';
import 'package:meditrace_project/Services/global_Data.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Personal%20Information%20View/personal_information_view.dart';

class SignUpViewmodel with ChangeNotifier {
  bool isCheck = false;

  bool isSignUpStart = false;
  bool isPasswordVisible = false;

  bool isSignUpError = false;
  bool isFocusPassword = false;
  bool isFocusEmail = false;
  bool isUiFieldsFill = false;
  bool isFocusPhoneNumber = false;
  bool isHiddenPassword = true;
  bool isPhoneNumberNotEmpty = false;
  bool isPasswordNotEmpty = false;
  bool isEmailNotEmpty = false;
  bool isEnableCode = false;
  String formattedNumber = '';
  checkEmailEmpty({required String email}) {
    if (email.isNotEmpty) {
      isEmailNotEmpty = true;

      notifyListeners();
    } else {
      isEmailNotEmpty = false;

      notifyListeners();
    }
  }

  checkPhoneNumberEmpty({required String phoneNumber}) {
    if (phoneNumber.isNotEmpty) {
      isPhoneNumberNotEmpty = true;
      isEnableCode = true;

      notifyListeners();
    } else {
      isPhoneNumberNotEmpty = false;
      isEnableCode = false;

      notifyListeners();
    }
  }

  checkPasswordEmpty({required String password}) {
    if (password.isNotEmpty) {
      isPasswordVisible = true;
      isSignUpError = false;
      isPasswordNotEmpty = true;

      notifyListeners();
    } else {
      isPasswordNotEmpty = false;
      isPasswordVisible = false;
      isSignUpError = false;

      notifyListeners();
    }
  }

  naviagtion(
      {required BuildContext context,
      required bool isReplaceMent,
      required bool isPop,
      required navigationName}) {
    if (isReplaceMent == true) {
      isCheck = false;
      isFocusEmail = false;
      isFocusPassword = false;
      isFocusPhoneNumber = false;
      isPasswordVisible = false;
      isHiddenPassword = true;
      isSignUpError = false;
      isSignUpStart = false;
      isUiFieldsFill = false;
      notifyListeners();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => navigationName()));
    } else if (isPop == true) {
      isCheck = false;
      isFocusEmail = false;
      isFocusPassword = false;
      isFocusPhoneNumber = false;
      isPasswordVisible = false;
      isHiddenPassword = true;
      isSignUpError = false;
      isSignUpStart = false;
      isUiFieldsFill = false;
      notifyListeners();
      Navigator.pop(context);
    } else {
      isCheck = false;
      isFocusEmail = false;
      isFocusPassword = false;
      isFocusPhoneNumber = false;
      isPasswordVisible = false;
      isHiddenPassword = true;
      isSignUpError = false;
      isSignUpStart = false;
      isUiFieldsFill = false;
      notifyListeners();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigationName));
    }
  }

  onChangedFocusOFUi(
      {required String emailText,
      required String PasswordText,
      required String phoneNumber,
      required bool ischeck}) {
    final String number = phoneNumber.toString();

    if ((emailText.length >= 5) &&
        (PasswordText.length >= 4) &&
        (number.length >= 10) &&
        (ischeck == true)) {
      isUiFieldsFill = true;
      print(
          'Password : ${PasswordText} | Phone Number : ${phoneNumber} | Email : ${emailText} | bool : ${isUiFieldsFill}');
      print('Check Box Hit Change Focus : ${ischeck}');
      notifyListeners();
    } else {
      isUiFieldsFill = false;
      print('Check Box Hit Change Focus : ${ischeck}');
      print(
          'Password : ${PasswordText} | Phone Number : ${phoneNumber} | Email : ${emailText} | bool : ${isUiFieldsFill}');

      notifyListeners();
    }
  }

  void onFocusChange(String field, bool hasFocus) {
    if (field == "email") {
      isFocusEmail = hasFocus;
      isEnableCode = false;
      notifyListeners();
    } else if (field == "phoneNumber") {
      isFocusPhoneNumber = hasFocus;
      isEnableCode = true;
      notifyListeners();
    } else if (field == "password") {
      isFocusPassword = hasFocus;
      isEnableCode = false;
      notifyListeners();
    }
    notifyListeners();
  }

  checkBoxHit() {
    isCheck = !isCheck;
    print('Check Box Hit : ${isCheck}');
    notifyListeners();
  }

  hiddenText() {
    isHiddenPassword = !isHiddenPassword;
    notifyListeners();
  }

  void onPasswordFocusChange(bool hasFocus) {
    isFocusPassword = hasFocus;

    notifyListeners();
  }

  void onEmailFocusChange(bool hasFocus) {
    isFocusEmail = hasFocus;

    notifyListeners();
  }

  void onPhoneNumberFocusChange(bool hasFocus) {
    isFocusPhoneNumber = hasFocus;

    notifyListeners();
  }

  validation({
    required String EmailText,
    required String Password,
    required String phoneNumber,
  }) {
    try {
      final numericString = phoneNumber.replaceAll(' ', '');
      int number = int.parse(numericString);
      if ((EmailText.contains('@') && (EmailText.contains('.com'))) &&
          (Password.length >= 5) &&
          (number != null && number.runtimeType == int) &&
          (phoneNumber.length == 10) &&
          (isCheck == true)) {
        // Remove any existing spaces from the input number
        String cleanedNumber = phoneNumber.replaceAll(' ', '');

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

          print("Formated Number ${formattedNumber}");
          return true;
        }

        // Format the number into +1 XXX XXX XXXX
      } else {
        return false;
      }
    } catch (e) {
      print('Erorr : ${e}');
      return false;
    }
  }

  signUpFunction(
      {required String Email,
      required String phoneNumber,
      required String Password,
      required BuildContext context}) async {
    isSignUpStart = true;
    isUiFieldsFill = false;
    notifyListeners();
    bool validate = await validation(
        EmailText: Email, Password: Password, phoneNumber: phoneNumber);
    if (validate == true) {
      isUiFieldsFill = false;
      notifyListeners();

      var mapApiCheck = {
        "email": Email.toString(),
      };
      var jsonBody = jsonEncode(mapApiCheck);

      bool apiCheck = await ApiService.checkUserForSignUp(body: jsonBody);

      if (apiCheck == true) {
        isSignUpStart = false;
        isUiFieldsFill = false;
        SignUpGlobalData.finalPassword = Password;
        SignUpGlobalData.finalEmailAddress = Email;

        SignUpGlobalData.finalPhoneNumber = formattedNumber;
        print(
            "Email : ${SignUpGlobalData.finalEmailAddress} | Password : ${SignUpGlobalData.finalPassword} | Phone Number : ${SignUpGlobalData.finalPhoneNumber}");
        notifyListeners();

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PersonalInformationView(
                      email: SignUpGlobalData.finalEmailAddress,
                      password: SignUpGlobalData.finalPassword,
                      phoneNumber: SignUpGlobalData.finalPhoneNumber,
                    )));
      } else {
        isSignUpStart = false;
        isCheck = false;
        isSignUpError = true;
        isUiFieldsFill = false;
        notifyListeners();
        await Future.delayed(const Duration(milliseconds: 1500));
        isSignUpError = false;
        notifyListeners();
      }
    } else {
      isSignUpStart = false;
      isCheck = false;
      isSignUpError = true;
      isUiFieldsFill = false;
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 1500));
      isSignUpError = false;
      notifyListeners();
    }
  }
}
