import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:pinput/pinput.dart';

class OtpFieldComponent extends StatefulWidget {
  const OtpFieldComponent(
      {super.key,
      required this.completed,
      required this.screenHeight,
      required this.screenWidth,
      required this.isError, required this.controller });

  final double screenHeight;
  final double screenWidth;
  final TextEditingController controller;
  final bool isError;
  final ValueChanged<String?> completed;

  @override
  State<OtpFieldComponent> createState() => _OtpFieldComponentState();
}

class _OtpFieldComponentState extends State<OtpFieldComponent> {
  final pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  final focusedBorderColor = AppColors.PrimaryBlueColor;
  final fillColor = AppColors.PrimaryBlueColor;
  final borderColor = AppColors.PrimaryBlueColor;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: widget.screenWidth * 0.150,
      height: widget.screenHeight * 0.070,
      textStyle: TextStyle(
        fontSize: widget.screenHeight * 0.025,
        color: AppColors.TextblackColor.withOpacity(0.6),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.screenWidth * 0.040),
        border: Border.all(
            width: widget.isError == true ? 1 : 2,
            color: widget.isError == true
                ? Colors.red
                : AppColors.unFocusPrimaryColor.withOpacity(0.4)),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              length: 4,
              controller: widget.controller,
              defaultPinTheme: defaultPinTheme,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                widget.completed(pin);
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
              focusedPinTheme: PinTheme(
                width: widget.screenWidth * 0.150,
                height: widget.screenHeight * 0.070,
                textStyle: TextStyle(
                  fontSize: widget.screenHeight * 0.025,
                  color: AppColors.TextblackColor,
                ),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(widget.screenWidth * 0.040),
                  border: Border.all(
                      width: widget.isError == true ? 1 : 2,
                      color: widget.isError == true
                          ? Colors.red
                          : AppColors.BagContainer),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
