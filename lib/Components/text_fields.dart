import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:meditrace_project/Views/Sign%20In%20View/signin_viewmodel.dart';

class TextFields extends StatelessWidget {
  const TextFields({
    super.key,
    required this.controller,
    required this.enablefillColor,
    required this.focusfillColor,
    required this.outlineColor,
    required this.radius,
    required this.HintText,
    required this.hintStyle,
    // required this.Onchanged,
    // required this.onfieldSubmitted,
    // required this.isenable,
  });

  final TextEditingController controller;
  final Color outlineColor;
  final double radius;
  final Color focusfillColor;
  final Color enablefillColor;
  final String HintText;
  final TextStyle hintStyle;


  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SigninViewmodel>(context);

    return Focus(
      onFocusChange: (hasFocus) {
        model.onFieldFocusChange(hasFocus);
      },
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: model.isFocused
              ? focusfillColor
              : enablefillColor, // Dynamically change fill color
          filled: true,
          hintText: HintText,
          hintStyle: hintStyle,
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: outlineColor.withOpacity(0.4),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: outlineColor.withOpacity(0.8), // Darker border on focus
              width: 2, // Thicker border on focus
            ),
          ),
        ),
      ),
    );
  }
}
