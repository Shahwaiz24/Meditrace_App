import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Emergency%20Contact%20View/emergency_contact_viewmodel.dart';
import 'package:provider/provider.dart';

class EmergencyContactView extends StatelessWidget {
  EmergencyContactView({super.key});

  TextEditingController contactNameContrller = TextEditingController();
  TextEditingController contactNumberContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model =
        Provider.of<EmergencyContactViewmodel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.ScaffoldColor,
      body: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.120,
            left: screenWidth * 0.070,
            right: screenWidth * 0.070),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Set up in case of an emergency',
              style: TextStyle(
                  color: AppColors.PrimaryBlueColor,
                  fontFamily: 'Poppins Medium',
                  fontSize: screenHeight * 0.018,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Text(
              'Emergency Contact',
              style: TextStyle(
                color: AppColors.TextblackColor,
                fontFamily: 'Poppins Bold',
                fontWeight: FontWeight.w700,
                fontSize: screenHeight * 0.022,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.050,
            ),
            Consumer<EmergencyContactViewmodel>(
                builder: (context, model, child) {
              return TextFields(
                  controller: contactNameContrller,
                  enablefillColor: Colors.black,
                  focusfillColor: model.isContactNameFocus == true
                      ? AppColors.TextwhiteColor
                      : model.isContactNameNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor:
                      model.error ? Colors.red : AppColors.unFocusPrimaryColor,
                  radius: screenWidth * 0.020,
                  isHidden: false,
                  HintText: model.error ? "Enter Correct Name" : 'Contact Name',
                  hintStyle: TextStyle(
                    color: model.error
                        ? Colors.red
                        : AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: Text(''),
                  Suffix: Text(''),
                  isSuffix: false,
                  isNumberKeyboard: false,
                  isPrefix: false,
                  onFocus: (focus) {
                    model.onContactNameFocus(focus: focus);
                  },
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    model.isContactNameEmptyCheck(
                        contactName: contactNameContrller.text);
                    model.checkallFields(
                        contactName: contactNameContrller.text,
                        contactNumber: contactNumberContrller.text);
                  });
            }),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<EmergencyContactViewmodel>(
                builder: (context, model, child) {
              return TextFields(
                  controller: contactNumberContrller,
                  enablefillColor: Colors.black,
                  focusfillColor: model.isContactNumberFocus == true
                      ? AppColors.TextwhiteColor
                      : model.isContactNumberNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor:
                      model.error ? Colors.red : AppColors.unFocusPrimaryColor,
                  radius: screenWidth * 0.020,
                  isHidden: false,
                  HintText: model.error
                      ? 'Enter Number in 10 Digits'
                      : 'Contact Number',
                  hintStyle: TextStyle(
                    color: model.error
                        ? Colors.red
                        : AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: Text(''),
                  Suffix: Text(''),
                  isSuffix: false,
                  isNumberKeyboard: true,
                  isPrefix: false,
                  onFocus: (focus) {
                    model.isContactNumberEmptyCheck(
                        contactNumber: contactNameContrller.text);
                    model.onContactPhoneNumberFocus(focus: focus);
                  },
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    model.checkallFields(
                        contactName: contactNameContrller.text,
                        contactNumber: contactNumberContrller.text);
                  });
            }),
            const Spacer(),
            Consumer<EmergencyContactViewmodel>(
                builder: (context, model, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (model.isUiFieldsFill == true &&
                            model.isStart == false) {
                          model.nextOntap(
                              context: context,
                              contactName: contactNameContrller.text,
                              contactNumber: contactNumberContrller.text);
                          contactNameContrller.clear();
                          contactNumberContrller.clear();
                        }
                      },
                      child: ButtonComponent(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          ButtonHeight: 0.075,
                          decoration: BoxDecoration(
                              color: model.isUiFieldsFill == true
                                  ? AppColors.PrimaryBlueColor
                                  : AppColors.unFocusPrimaryColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.080)),
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: AppColors.TextwhiteColor,
                                  fontFamily: 'Poppins Semi Bold',
                                  fontSize: screenHeight * 0.020),
                            ),
                          )),
                    ),
                    SizedBox(height: screenHeight * 0.010),
                    InkWell(
                      onTap: () {
                        // if (model.isStart == false) {
                        //   model.onSetupLater(context: context);
                        // }
                        model.onSetupLater(context: context);
                      },
                      child: Text(
                        'Set up Later',
                        style: TextStyle(
                            color: AppColors.PrimaryBlueColor,
                            fontFamily: "Poppins Bold",
                            fontSize: screenHeight * 0.018),
                      ),
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}