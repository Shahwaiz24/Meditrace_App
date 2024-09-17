import 'package:flutter/material.dart';
import 'package:meditrace_project/Views/Sign%20In%20View/signin_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Medical%20Information%20SignUp%20View/medical_information_viewModel_signUp.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/signup_viewmodel.dart';
import 'package:provider/provider.dart';

class TextFields extends StatelessWidget {
  TextFields(
      {super.key,
      required this.controller,
      required this.enablefillColor,
      required this.focusfillColor,
      required this.outlineColor,
      required this.radius,
      required this.isHidden,
      required this.HintText,
      required this.hintStyle,
      required this.Prefix,
      required this.Suffix,
      required this.isSuffix,
      required this.isNumberKeyboard,
      required this.isPrefix,
      required this.onFocus,
      required this.contentStyle,
      required this.onChanged});

  final TextEditingController controller;
  final Color outlineColor;
  final double radius;
  final Color focusfillColor;

  final Color enablefillColor;
  final String HintText;
  final TextStyle hintStyle;

  final bool isPrefix;
  final Widget Prefix;
  final bool isSuffix;
  final Widget Suffix;
  final ValueChanged<bool> onFocus;
  final Function onChanged;
  final bool isNumberKeyboard;
  final bool isHidden;
  final TextStyle contentStyle;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        onFocus(hasFocus);
      },
      child: TextFormField(
        style: contentStyle,
        onChanged: (string) {
          onChanged();
        },
        controller: controller,
        keyboardType:
            isNumberKeyboard == true ? TextInputType.phone : TextInputType.name,
        obscureText: isHidden,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          suffixIcon: isSuffix == true ? Suffix : null,
          prefixIcon: isPrefix == true ? Prefix : null,
          fillColor: focusfillColor,
          filled: true,
          hintText: HintText,
          hintStyle: hintStyle,
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: outlineColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: outlineColor, // Darker border on focus
              width: 2, // Thicker border on focus
            ),
          ),
        ),
      ),
    );
  }
}
