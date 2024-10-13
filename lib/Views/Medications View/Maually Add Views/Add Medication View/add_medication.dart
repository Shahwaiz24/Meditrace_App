import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/custom_dropdown_menu.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Add%20Medication%20View/add_medication_viewmodel.dart';
import 'package:provider/provider.dart';

class AddMedication extends StatelessWidget {
  AddMedication({super.key});

  final TextEditingController medicineName = TextEditingController();
  final TextEditingController medicineStrength = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddMedicationViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.100,
          left: screenWidth * 0.070,
          right: screenWidth * 0.070,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add details for us to give you reminders',
              style: TextStyle(
                  color: AppColors.PrimaryBlueColor,
                  fontFamily: 'Poppins Medium',
                  fontSize: screenHeight * 0.016),
            ),
            SizedBox(height: screenHeight * 0.010),
            Text(
              "Add Medication",
              style: TextStyle(
                  color: AppColors.TextblackColor,
                  fontFamily: 'Poppins Bold',
                  fontSize: screenHeight * 0.020),
            ),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<AddMedicationViewmodel>(builder: (context, model, value) {
              return TextFields(
                  controller: medicineName,
                  enablefillColor: Colors.black,
                  focusfillColor: model.isNameFocus == true
                      ? AppColors.TextwhiteColor
                      : model.isNameNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: AppColors.unFocusPrimaryColor,
                  radius: BorderRadius.circular(screenWidth * 0.020),
                  isHidden: false,
                  HintText: "Medication Name",
                  hintStyle: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: Text(""),
                  Suffix: Text(""),
                  isSuffix: false,
                  isNumberKeyboard: false,
                  isPrefix: false,
                  onFocus: (value) {
                    model.onNameFocus(focus: value);
                  },
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    model.isNameEmptyCheck(name: medicineName.text);
                    model.checkallFields(
                        name: medicineName.text,
                        strength: medicineStrength.text,
                        unit: model.selectedUnit);
                  });
            }),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<AddMedicationViewmodel>(builder: (context, model, value) {
              return TextFields(
                  controller: medicineStrength,
                  enablefillColor: Colors.black,
                  focusfillColor: model.isStrengthFocus == true
                      ? AppColors.TextwhiteColor
                      : model.isStrengthNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: AppColors.unFocusPrimaryColor,
                  radius: BorderRadius.circular(screenWidth * 0.020),
                  isHidden: false,
                  HintText: "Medication Strength",
                  hintStyle: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: Text(""),
                  Suffix: Text(""),
                  isSuffix: false,
                  isNumberKeyboard: true,
                  isPrefix: false,
                  onFocus: (value) {
                    model.onStrengthFocus(focus: value);
                  },
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {
                    model.isStrengthEmptyCheck(strength: medicineStrength.text);
                    model.checkallFields(
                        name: medicineName.text,
                        strength: medicineStrength.text,
                        unit: model.selectedUnit);
                  });
            }),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<AddMedicationViewmodel>(builder: (context, model, value) {
              return CustomDropdown(
                items: ["mg", "mcg", "g", "ml", "%"],
                onChanged: (value) {
                  model.selectUnit(unit: value!);
                  model.checkallFields(
                      name: medicineName.text,
                      strength: medicineStrength.text,
                      unit: model.selectedUnit);
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
                  fillColor: model.isUnitSelect == true
                      ? AppColors.TextwhiteColor
                      : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                ),
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                hint: Text(
                  "Strength Unit",
                  style: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                ),
                itemstyle: const TextStyle(
                    fontFamily: 'Poppins Regular', fontWeight: FontWeight.w500),
              );
            }),
            const Spacer(),
            Consumer<AddMedicationViewmodel>(builder: (context, model, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (model.isFieldsFill == true) {
                          model.next(
                              name: medicineName.text,
                              strength: medicineStrength.text,
                              unit: model.selectedUnit);
                          medicineName.clear();
                          UserGlobalData.selectedBottomBarIndex = 0;

                          medicineStrength.clear();
                        }
                      },
                      child: ButtonComponent(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          ButtonHeight: 0.075,
                          decoration: BoxDecoration(
                              color: model.isFieldsFill == true
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
                        medicineName.clear();
                        medicineStrength.clear();
                        UserGlobalData.selectedBottomBarIndex = 0;

                        model.navigateToBack(context: context);
                      },
                      child: Text(
                        "Go Back",
                        style: TextStyle(
                            color: AppColors.PrimaryBlueColor,
                            fontFamily: "Poppins Bold",
                            fontSize: screenHeight * 0.018),
                      ),
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
