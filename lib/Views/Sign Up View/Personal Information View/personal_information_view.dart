import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/custom_dropdown_menu.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Personal%20Information%20View/personal_information_viewmodel.dart';
import 'package:provider/provider.dart';

class PersonalInformationView extends StatelessWidget {
  PersonalInformationView({super.key});

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PersonalInformationViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.120,
            left: screenWidth * 0.070,
            right: screenWidth * 0.070),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tell us about your health.',
              style: TextStyle(
                  color: AppColors.PrimaryBlueColor,
                  fontFamily: 'Poppins Medium',
                  fontSize: screenHeight * 0.017,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Text(
              'Personal Information',
              style: TextStyle(
                color: AppColors.TextblackColor,
                fontFamily: 'Poppins Bold',
                fontSize: screenHeight * 0.020,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<PersonalInformationViewmodel>(
                builder: (context, model, child) {
              return CustomDropdown(
                icon: Icon(Icons.keyboard_arrow_down_outlined),
                hint: Text(
                  'Prefix',
                  style: TextStyle(
                      color: AppColors.unFocusPrimaryColor,
                      fontFamily: 'Poppins Regular',
                      fontSize: screenHeight * 0.022),
                ),
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.020),
                      borderSide: BorderSide(
                          color: AppColors.unFocusPrimaryColor, width: 1)),
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.020),
                      borderSide: BorderSide(
                          color: AppColors.unFocusPrimaryColor, width: 1)),
                  fillColor: model.isPrefixSelect == true
                      ? AppColors.TextwhiteColor
                      : AppColors.DropDownUnfocusColor.withOpacity(0.2),
                ),
                items: ["Mr.", "Mrs.", "Miss."],
                itemstyle: TextStyle(fontFamily: 'Poppins Medium'),
                onChanged: (String? newValue) {
                  model.selectPrefix(prefix: newValue!);
                },
              );
            }),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<PersonalInformationViewmodel>(
                builder: (context, model, child) {
              return TextFields(
                  onFocus: (value) {
                    model.onFirstNameFocusChange(value);
                  },
                  controller: firstNameController,
                  enablefillColor:
                      AppColors.DropDownUnfocusColor.withOpacity(0.2),
                  focusfillColor: model.isFocusFirstName == true
                      ? AppColors.TextwhiteColor
                      : AppColors.DropDownUnfocusColor.withOpacity(0.2),
                  outlineColor: AppColors.unFocusPrimaryColor,
                  radius: screenWidth * 0.020,
                  isHidden: false,
                  HintText: 'First Name',
                  hintStyle: TextStyle(
                      color: AppColors.unFocusPrimaryColor,
                      fontFamily: 'Poppins Regular',
                      fontSize: screenHeight * 0.022),
                  Prefix: Text(''),
                  Suffix: Text(''),
                  contentStyle: TextStyle(),
                  isSuffix: false,
                  isNumberKeyboard: false,
                  isPrefix: false,
                  onChanged: () {
                    model.checkFirstNameEmpty(controller: firstNameController);
                  });
            })
          ],
        ),
      ),
    );
  }
}
