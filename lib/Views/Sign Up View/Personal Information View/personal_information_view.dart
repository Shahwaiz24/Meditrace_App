import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/custom_dropdown_menu.dart';
import 'package:meditrace_project/Components/date_picker.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/global_data.dart';
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
              height: screenHeight * 0.050,
            ),
            Consumer<PersonalInformationViewmodel>(
                builder: (context, model, child) {
              return CustomDropdown(
                icon: model.isPrefixSelect == true
                    ? Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.TextblackColor,
                      )
                    : Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.unFocusPrimaryColor,
                      ),
                hint: Text(
                  'Prefix',
                  style: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
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
                      : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                ),
                items: const ["Mr.", "Mrs.", "Miss."],
                itemstyle: const TextStyle(
                    fontFamily: 'Poppins Regular', fontWeight: FontWeight.w500),
                onChanged: (String? newValue) {
                  model.selectPrefix(prefix: newValue!);
                  model.checkallFields(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                  );
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
                  enablefillColor: Colors.black,
                  focusfillColor: model.isFocusFirstName == true
                      ? AppColors.TextwhiteColor
                      : model.isFirstNameNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: AppColors.unFocusPrimaryColor,
                  radius: screenWidth * 0.020,
                  isHidden: false,
                  HintText: 'First Name',
                  hintStyle: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: const Text(''),
                  Suffix: const Text(''),
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  isSuffix: false,
                  isNumberKeyboard: false,
                  isPrefix: false,
                  onChanged: (value) {
                    model.checkFirstNameEmpty(
                        firstName: firstNameController.text);
                    model.checkallFields(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                    );
                  });
            }),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<PersonalInformationViewmodel>(
                builder: (context, model, child) {
              return TextFields(
                  onFocus: (value) {
                    model.onLastNameFocusChange(value);
                  },
                  controller: lastNameController,
                  enablefillColor:
                      AppColors.DropDownUnfocusColor.withOpacity(0.2),
                  focusfillColor: model.isFocusLastName == true
                      ? AppColors.TextwhiteColor
                      : model.isLastNameNotEmpty
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: AppColors.unFocusPrimaryColor,
                  radius: screenWidth * 0.020,
                  isHidden: false,
                  HintText: 'Last Name',
                  hintStyle: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: const Text(''),
                  Suffix: const Text(''),
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  isSuffix: false,
                  isNumberKeyboard: false,
                  isPrefix: false,
                  onChanged: (value) {
                    model.checkLastNameEmpty(lastName: lastNameController.text);
                    model.checkallFields(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                    );
                  });
            }),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<PersonalInformationViewmodel>(
                builder: (context, model, child) {
              return CustomDropdown(
                icon: model.isGenderSelect == true
                    ? Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.TextblackColor,
                      )
                    : Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.unFocusPrimaryColor,
                      ),
                hint: Text(
                  'Gender',
                  style: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
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
                  fillColor: model.isGenderSelect == true
                      ? AppColors.TextwhiteColor
                      : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                ),
                items: const [
                  "Male",
                  "Female",
                  "Transgender",
                  "Non-Binary",
                  "Prefer not to say"
                ],
                itemstyle: const TextStyle(
                    fontFamily: 'Poppins Regular', fontWeight: FontWeight.w500),
                onChanged: (String? newValue) async {
                  model.selectGender(gender: newValue!);
                  await model.checkallFields(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                  );
                },
              );
            }),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<PersonalInformationViewmodel>(
                builder: (context, model, child) {
              return InkWell(
                onTap: () async {
                  if (model.isBirthDatePicked == false) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDatePicker(
                              onSelect: (value) {
                                model.onDateSelect(date: value);
                              },
                              isDateOfBirth: true,
                              isDialogOpen: true);
                        });
                    await model.checkallFields(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                    );
                  }
                },
                child: ButtonComponent(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  ButtonHeight: 0.065,
                  decoration: BoxDecoration(
                      color: model.isBirthDatePicked == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(screenWidth * 0.020),
                      border: Border.all(
                          color: AppColors.unFocusPrimaryColor, width: 1)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.030),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.isBirthDatePicked == true
                              ? model.SelectedBirth
                              : 'Date of Birth',
                          style: TextStyle(
                              color: model.isBirthDatePicked == true
                                  ? AppColors.TextblackColor
                                  : AppColors.unFocusPrimaryColor,
                              fontFamily: 'Poppins Regular',
                              fontSize: screenHeight * 0.020),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: model.isBirthDatePicked == true
                              ? AppColors.TextblackColor
                              : AppColors.unFocusPrimaryColor,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            Consumer<PersonalInformationViewmodel>(
                builder: (context, model, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: InkWell(
                  onTap: () {
                    if (model.isUiFieldsFill == true) {
                      model.next(
                          context: context,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          Birthdate: model.SelectedBirth,
                          Gender: model.Selectedgender,
                          Prefix: model.Selectedprefix);
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
              );
            }),
          ],
        ),
      ),
    );
  }
}
