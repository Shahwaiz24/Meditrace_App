import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';

class PersonalInformationViewmodel with ChangeNotifier {
  bool isPrefixSelect = false;
  bool isFirstNameError = false;
  bool isFocusFirstName = false;
  bool isFirstNameNotEmpty = false;

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

  void checkFirstNameEmpty({required TextEditingController controller}) {
    if (controller.text.isEmpty) {
      isFirstNameNotEmpty = false;
      notifyListeners();
    }else{
       isFirstNameNotEmpty = true;
      notifyListeners();
    }
  }

}
