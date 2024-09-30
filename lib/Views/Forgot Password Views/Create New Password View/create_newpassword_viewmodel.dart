import 'package:flutter/material.dart';

class CreateNewpasswordViewmodel with ChangeNotifier {
  bool isFocusPassword = false;
  bool isFocusRepeatPassword = false;
  bool isPasswordNotEmpty = false;
  bool isRepeatPasswordNotEmpty = false;
  bool isError = false;
}
