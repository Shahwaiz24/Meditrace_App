import 'package:flutter/material.dart';
import 'package:meditrace_project/Views/Sign%20In%20View/signin_viewmodel.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Medical%20Information%20SignUp%20View/medical_information_viewModel_signUp.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/signup_viewmodel.dart';
import 'package:provider/provider.dart';

class TextFields extends StatelessWidget {
  const TextFields(
      {super.key,
      required this.controller,
      required this.enablefillColor,
      required this.focusfillColor,
      required this.outlineColor,
      required this.radius,
      required this.isHidden,
      required this.HintText,
      required this.hintStyle,
      required this.isEmailFocus,
      required this.modelName,
      required this.Prefix,
      required this.Suffix,
      required this.isMedical,
      required this.isSuffix,
      required this.isNumberKeyboard,
      required this.fieldName,
      required this.isPrefix,
      required this.onChanged});

  final TextEditingController controller;
  final Color outlineColor;
  final double radius;
  final Color focusfillColor;
  final Color enablefillColor;
  final String HintText;
  final TextStyle hintStyle;
  final bool isEmailFocus;
  final bool isPrefix;
  final Widget Prefix;
  final bool isSuffix;
  final Widget Suffix;
  final Function onChanged;
  final bool isNumberKeyboard;
  final bool isHidden;
  final String modelName;
  final String fieldName;
  final bool isMedical;

  @override
  Widget build(BuildContext context) {
    if (modelName == 'SigninViewmodel') {
      final model = Provider.of<SigninViewmodel>(context);

      return Focus(
        onFocusChange: (hasFocus) {
          if (isEmailFocus == true) {
            model.onEmailFocusChange(hasFocus);
          } else {
            model.onPasswordFocusChange(hasFocus);
          }
        },
        child: TextFormField(
          onChanged: (string) {
            onChanged();
          },
          controller: controller,
          obscureText: isHidden,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            suffixIcon: isSuffix == true ? Suffix : const SizedBox.shrink(),
            prefixIcon: isPrefix == true ? Prefix : const SizedBox.shrink(),
            fillColor: isEmailFocus
                ? (model.isFocusEmail ? focusfillColor : enablefillColor)
                : (model.isFocusPassword
                    ? focusfillColor
                    : enablefillColor), // Dynamically change fill color
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
    } else if (isMedical == true) {
      final model = Provider.of<MedicalInformationSignUpViewModel>(context);
      Color determineFillColor() {
        switch (fieldName) {
          case "allergies":
            return model.isFocusAllergies ? focusfillColor : enablefillColor;
          case "chronic":
            return model.isFocusChronic ? focusfillColor : enablefillColor;
          case "medication":
            return model.isFocusMedication ? focusfillColor : enablefillColor;
          default:
            return enablefillColor; // Default color if no matching field
        }
      }
    }
    final model = Provider.of<SignUpViewmodel>(context);

    // Adjust the fill color based on the field name and focus status
    Color determineFillColor() {
      switch (fieldName) {
        case "email":
          return model.isFocusEmail ? focusfillColor : enablefillColor;
        case "password":
          return model.isFocusPassword ? focusfillColor : enablefillColor;
        case "fullName":
          return model.isFocusName ? focusfillColor : enablefillColor;
        case "phoneNumber":
          return model.isFocusPhoneNumber ? focusfillColor : enablefillColor;
        default:
          return enablefillColor; // Default color if no matching field
      }
    }

    return Focus(
      onFocusChange: (hasFocus) {
        model.onFocusChange(fieldName, hasFocus);
      },
      child: TextFormField(
        onChanged: (string) {
          onChanged();
        },
        controller: controller,
        obscureText: isHidden,
        keyboardType: isNumberKeyboard == true
            ? TextInputType.phone // Numbers wala keyboard
            : TextInputType.text, // Default keyboard
        obscuringCharacter: '*',
        decoration: InputDecoration(
          suffixIcon: isSuffix == true ? Suffix : const SizedBox.shrink(),
          prefixIcon: isPrefix == true ? Prefix : const SizedBox.shrink(),
          fillColor: determineFillColor(), // Dynamically change fill color
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
