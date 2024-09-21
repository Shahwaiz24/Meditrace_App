import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Sign%20Up%20Completed/signup_completed_view.dart';

class EmergencyContactViewmodel with ChangeNotifier {
  bool isContactNameFocus = false;
  bool isStart = false;
  bool isContactNumberFocus = false;
  bool isContactNameNotEmpty = false;
  bool isContactNumberNotEmpty = false;
  bool isUiFieldsFill = false;
  bool error = false;

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

  validate({required String contactName, required String contactNumber}) {
    try {
      final int number = int.parse(contactNumber);
      if ((contactName.isNotEmpty) &&
          (contactNumber.isNotEmpty && contactNumber.length == 10) &&
          (number != null)) {
        return true;
      } else {
        return false;
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
      required BuildContext context}) async {
    isStart = true;

    notifyListeners();
    bool validation =
        await validate(contactName: contactName, contactNumber: contactNumber);
    if (validation == true) {
      SignUpGlobalData.contactName = contactName;
      SignUpGlobalData.contactNumber = contactNumber;
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
      notifyListeners();
      await Future.delayed(Duration(seconds: 4));
      error = false;
      notifyListeners();
    }
  }

  checkallFields({required String contactName, required String contactNumber}) {
    isUiFieldsFill = false;
    notifyListeners();
    if ((contactName != null && contactName.isNotEmpty) &&
        (contactNumber != null &&
            contactNumber.isNotEmpty &&
            contactNumber.length == 10)) {
      isUiFieldsFill = true;
      print(
          " Bool : ${isUiFieldsFill} | Contact Name : ${contactName} | Number : ${contactNumber}");

      notifyListeners();
    } else {
      isUiFieldsFill = false;
      print(
          " Bool : ${isUiFieldsFill} | Contact Name : ${contactName} | Number : ${contactNumber}");

      notifyListeners();
    }
  }
}
