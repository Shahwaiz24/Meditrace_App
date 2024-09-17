import 'package:flutter/material.dart';

class PersonalInformationViewmodel with ChangeNotifier {
  bool isPrefixSelect = false;

  void selectPrefix() {
    isPrefixSelect = true;
    notifyListeners();
  }
}
