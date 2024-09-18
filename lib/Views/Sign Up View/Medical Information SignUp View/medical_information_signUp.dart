import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/custom_dropdown_menu.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Medical%20Information%20SignUp%20View/medical_information_viewModel_signUp.dart';
import 'package:provider/provider.dart';

class MedicalInformationSignupView extends StatelessWidget {
  MedicalInformationSignupView({super.key});

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController medicationsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MedicalInformationSignUpViewModel>(context);
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
              'Medical Information',
              style: TextStyle(
                color: AppColors.TextblackColor,
                fontFamily: 'Poppins Bold',
                fontSize: screenHeight * 0.020,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.050,
            ),
            Consumer<MedicalInformationSignUpViewModel>(
                builder: (context, model, child) {
              return CustomDropdown(
                items: ["O+", "O-", "A+", "A-", "B+", "B-", "AB+", "AB-"],
                onChanged: (value) {
                  model.onBloodGroupSelect(bloodGroup: value!);
                  model.onChangedFocusOFUi(
                      bloodGroup: model.selectedBloodGroup,
                      allergies: model.selectedAllergies,
                      chronic: model.selectedChronicConditions,
                      weight: weightController.text,
                      height: heightController.text);
                },
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
                  fillColor: model.isBloodGroupSelect == true
                      ? AppColors.TextwhiteColor
                      : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                ),
                icon: model.isBloodGroupSelect == true
                    ? Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.TextblackColor,
                      )
                    : Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.unFocusPrimaryColor,
                      ),
                hint: Text(
                  'Blood Group',
                  style: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                ),
                itemstyle: const TextStyle(
                    fontFamily: 'Poppins Regular', fontWeight: FontWeight.w500),
              );
            }),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<MedicalInformationSignUpViewModel>(
              builder: (context, model, child) {
                return TextFields(
                  contentStyle: const TextStyle(
                    fontFamily: 'Poppins Regular',
                    fontWeight: FontWeight.w500,
                  ),
                  onFocus: (value) {
                    model.onFocusChange('weight', value);
                  },
                  controller: weightController,
                  enablefillColor:
                      AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  focusfillColor: model.isFocusWeight == true
                      ? AppColors.TextwhiteColor
                      : model.isWeightNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: model.isError
                      ? Colors.red.withOpacity(0.5)
                      : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                  radius: screenHeight * 0.010,
                  isHidden: false,
                  HintText: model.isError
                      ? 'Enter Correct Weight In lbs'
                      : 'Weight (lbs)',
                  hintStyle: TextStyle(
                    color: model.isError
                        ? Colors.red
                        : AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: Text(''),
                  Suffix: Text(''),
                  isSuffix: false,
                  isNumberKeyboard: true,
                  isPrefix: false,
                  onChanged: () {
                    // Ensure 'lbs' is added only once
                    if (!weightController.text.contains('lbs')) {
                      weightController.text += ' lbs';
                      weightController.selection = TextSelection.fromPosition(
                        TextPosition(offset: weightController.text.length - 4),
                      );
                    }
                    model.onChangedFocusOFUi(
                        bloodGroup: model.selectedBloodGroup,
                        allergies: model.selectedAllergies,
                        chronic: model.selectedChronicConditions,
                        weight: weightController.text,
                        height: heightController.text);
                  },
                );
              },
            ),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<MedicalInformationSignUpViewModel>(
                builder: (context, model, child) {
              return TextFields(
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  onFocus: (value) {
                    model.onFocusChange('height', value);
                  },
                  controller: heightController,
                  enablefillColor:
                      AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  focusfillColor: model.isFocusHeight == true
                      ? AppColors.TextwhiteColor
                      : model.isHeightNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: model.isError
                      ? Colors.red.withOpacity(0.5)
                      : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                  radius: screenHeight * 0.010,
                  isHidden: false,
                  HintText: model.isError
                      ? 'Enter Correct Height in cm'
                      : 'Height (cm)',
                  hintStyle: TextStyle(
                    color: model.isError
                        ? Colors.red
                        : AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: Text(''),
                  Suffix: Text(''),
                  isSuffix: false,
                  isNumberKeyboard: true,
                  isPrefix: false,
                  onChanged: () {
                    if (!heightController.text.contains('cm')) {
                      heightController.text += ' cms';
                      heightController.selection = TextSelection.fromPosition(
                        TextPosition(offset: heightController.text.length - 4),
                      );
                    }
                    model.onChangedFocusOFUi(
                        bloodGroup: model.selectedBloodGroup,
                        allergies: model.selectedAllergies,
                        chronic: model.selectedChronicConditions,
                        weight: weightController.text,
                        height: heightController.text);
                  });
            }),
            SizedBox(
              height: screenHeight * 0.030,
            ),

            Consumer<MedicalInformationSignUpViewModel>(
                builder: (context, model, child) {
              return Column(
                children: [
                  CustomDropdown(
                    items: model.allAllergies,
                    onChanged: (value) {
                      model.onAllergiesSelect(allergies: value!);
                      model.onChangedFocusOFUi(
                          bloodGroup: model.selectedBloodGroup,
                          allergies: model.selectedAllergies,
                          chronic: model.selectedChronicConditions,
                          weight: weightController.text,
                          height: heightController.text);
                    },
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
                      fillColor: model.isBloodGroupSelect == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                    ),
                    icon: model.isBloodGroupSelect == true
                        ? Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.TextblackColor,
                          )
                        : Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.unFocusPrimaryColor,
                          ),
                    hint: Text(
                      'Known Allergies',
                      style: TextStyle(
                        color: AppColors.unFocusPrimaryColor,
                        fontFamily: 'Poppins Regular',
                      ),
                    ),
                    itemstyle: const TextStyle(
                        fontFamily: 'Poppins Regular', fontWeight: FontWeight.w500),
                  ),
                    SizedBox(height: screenHeight * 0.020),

                  // Display selected items as chips
                  Wrap(
                    spacing: 8.0,
                    children: model.selectedAllergies.map((condition) {
                      return Chip(
                        label: Text(
                          condition,
                          style: TextStyle(
                              fontFamily: 'Poppins Regular',
                              color: AppColors.TextblackColor,
                              fontSize: screenHeight * 0.020),
                        ),
                        onDeleted: () {
                          model.onAllergiesSelect(
                              allergies: condition); // Toggle selection
                        },
                        deleteIcon: Icon(
                          Icons.close_rounded,
                          color: AppColors.TextblackColor,
                        ),
                        backgroundColor: AppColors
                            .TextwhiteColor, // Change chip color as needed
                      );
                    }).toList(),
                  ),
                ],
              );
            }),
            SizedBox(
              height: screenHeight * 0.030,
            ),

            Consumer<MedicalInformationSignUpViewModel>(
              builder: (context, model, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropdown(
                      items: model.allChronicConditions,
                      onChanged: (value) {
                        if (value != null) {
                          model.onChronicSelect(
                              condition: value); // Toggle selection
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.020),
                          borderSide: BorderSide(
                              color: AppColors.unFocusPrimaryColor, width: 1),
                        ),
                        enabled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.020),
                          borderSide: BorderSide(
                              color: AppColors.unFocusPrimaryColor, width: 1),
                        ),
                        fillColor: model.isChronicSelected == true
                            ? AppColors.TextwhiteColor
                            : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                      ),
                      icon: model.isChronicSelected == true
                          ? Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColors.TextblackColor,
                            )
                          : Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColors.unFocusPrimaryColor,
                            ),
                      hint: Text(
                        'Chronic Conditions', // Hint remains static
                        style: TextStyle(
                          color: AppColors.unFocusPrimaryColor,
                          fontFamily: 'Poppins Regular',
                        ),
                      ),
                      itemstyle: const TextStyle(
                          fontFamily: 'Poppins Regular',
                          fontWeight: FontWeight.w500),
                    ),
                    // Dropdown for selecting chronic conditions

                    SizedBox(height: screenHeight * 0.020),

                    // Display selected items as chips
                    Wrap(
                      spacing: 8.0,
                      children:
                          model.selectedChronicConditions.map((condition) {
                        return Chip(
                          label: Text(
                            condition,
                            style: TextStyle(
                                fontFamily: 'Poppins Regular',
                                color: AppColors.TextblackColor,
                                fontSize: screenHeight * 0.020),
                          ),
                          onDeleted: () {
                            model.onChronicSelect(
                                condition: condition); // Toggle selection
                          },
                          deleteIcon: Icon(
                            Icons.close_rounded,
                            color: AppColors.TextblackColor,
                          ),
                          backgroundColor: AppColors
                              .TextwhiteColor, // Change chip color as needed
                        );
                      }).toList(),
                    ),
                  ],
                );
              },
            ),

           
            const Spacer(),
            Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: Consumer<MedicalInformationSignUpViewModel>(
                    builder: (context, model, child) {
                  return InkWell(
                    onTap: () async {
                      // if (model.isStart == false &&
                      //     (chronicConditionsController.text.isNotEmpty) &&
                      //     (medicationsController.text.isNotEmpty) &&
                      //     (knownAllergiesController.text.isNotEmpty)) {
                      //   await model.nextSignInFunction(
                      //       context: context,
                      //       chronic: chronicConditionsController.text,
                      //       medication: medicationsController.text,
                      //       allergies: knownAllergiesController.text);
                      //   }
                      // },}
                    },
                    child: ButtonComponent(
                      decoration: BoxDecoration(
                          color: model.isUiFieldsFill
                              ? AppColors.PrimaryBlueColor
                              : AppColors.unFocusPrimaryColor,
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.080)),
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      ButtonHeight: 0.075,
                      child: Center(
                        child: model.isStart
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.PrimaryBlueColor,
                                ),
                              )
                            : Center(
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      color: AppColors.TextwhiteColor,
                                      fontFamily: 'Poppins Semi Bold',
                                      fontSize: screenHeight * 0.020),
                                ),
                              ),
                      ),
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }
}
