import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Sign%20Up%20View/Medical%20Information%20SignUp%20View/medical_information_viewModel_signUp.dart';
import 'package:provider/provider.dart';

class MedicalInformationSignupView extends StatelessWidget {
  MedicalInformationSignupView({super.key});

  final TextEditingController knownAllergiesController =
      TextEditingController();
  final TextEditingController chronicConditionsController =
      TextEditingController();
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
              return TextFields(
                  isMedical: true,
                  controller: knownAllergiesController,
                  enablefillColor:
                      AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  focusfillColor: AppColors.TextwhiteColor,
                  outlineColor: model.isError
                      ? Colors.red.withOpacity(0.5)
                      : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                  radius: screenHeight * 0.010,
                  isHidden: false,
                  HintText: model.isError
                      ? 'Enter Correct Allergies'
                      : 'Known Allergies',
                  hintStyle: TextStyle(
                      color: model.isError
                          ? Colors.red.withOpacity(0.5)
                          : Colors.grey,
                      fontFamily: 'Poppins Regular',
                      fontSize: screenHeight * 0.018),
                  isEmailFocus: false,
                  modelName: 'MedicalInformationSignUpViewModel',
                  Prefix: Text(''),
                  Suffix: Text(''),
                  isSuffix: false,
                  isNumberKeyboard: false,
                  fieldName: 'chronic',
                  isPrefix: false,
                  onChanged: () {
                    model.onChangedFocusOFUi(
                        allergies: knownAllergiesController.text,
                        chronic: chronicConditionsController.text,
                        medication: medicationsController.text);
                  });
            }),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<MedicalInformationSignUpViewModel>(
                builder: (context, model, child) {
              return TextFields(
                  isMedical: true,
                  controller: chronicConditionsController,
                  enablefillColor:
                      AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  focusfillColor: AppColors.TextwhiteColor,
                  outlineColor: model.isError
                      ? Colors.red.withOpacity(0.5)
                      : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                  radius: screenHeight * 0.010,
                  isHidden: false,
                  HintText: model.isError
                      ? 'Enter Correct Conditions'
                      : 'Chronic Conditions',
                  hintStyle: TextStyle(
                      color: model.isError
                          ? Colors.red.withOpacity(0.5)
                          : Colors.grey,
                      fontFamily: 'Poppins Regular',
                      fontSize: screenHeight * 0.018),
                  isEmailFocus: false,
                  modelName: 'MedicalInformationSignUpViewModel',
                  Prefix: Text(''),
                  Suffix: Text(''),
                  isSuffix: false,
                  isNumberKeyboard: false,
                  fieldName: 'chronic',
                  isPrefix: false,
                  onChanged: () {
                    model.onChangedFocusOFUi(
                        allergies: knownAllergiesController.text,
                        chronic: chronicConditionsController.text,
                        medication: medicationsController.text);
                  });
            }),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<MedicalInformationSignUpViewModel>(
                builder: (context, model, child) {
              return TextFields(
                  isMedical: true,
                  controller: medicationsController,
                  enablefillColor:
                      AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  focusfillColor: AppColors.TextwhiteColor,
                  outlineColor: model.isError
                      ? Colors.red.withOpacity(0.5)
                      : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                  radius: screenHeight * 0.010,
                  isHidden: false,
                  HintText: model.isError
                      ? 'Enter Correct Medications'
                      : 'Medications',
                  hintStyle: TextStyle(
                      color: model.isError
                          ? Colors.red.withOpacity(0.5)
                          : Colors.grey,
                      fontFamily: 'Poppins Regular',
                      fontSize: screenHeight * 0.018),
                  isEmailFocus: false,
                  modelName: 'MedicalInformationSignUpViewModel',
                  Prefix: Text(''),
                  Suffix: Text(''),
                  isSuffix: false,
                  isNumberKeyboard: false,
                  fieldName: 'medication',
                  isPrefix: false,
                  onChanged: () {
                    model.onChangedFocusOFUi(
                        allergies: knownAllergiesController.text,
                        chronic: chronicConditionsController.text,
                        medication: medicationsController.text);
                  });
            }),
            const Spacer(),
            Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: Consumer<MedicalInformationSignUpViewModel>(
                    builder: (context, model, child) {
                  return InkWell(
                    onTap: () async {
                      if (model.isStart == false &&
                          (chronicConditionsController.text.isNotEmpty) &&
                          (medicationsController.text.isNotEmpty) &&
                          (knownAllergiesController.text.isNotEmpty)) {
                        await model.nextSignInFunction(
                            context: context,
                            chronic: chronicConditionsController.text,
                            medication: medicationsController.text,
                            allergies: knownAllergiesController.text);
                      }
                    },
                    child: ButtonComponent(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      ButtonHeight: 0.075,
                      radius: 0.080,
                      backgroundColor: model.isUiFieldsFill
                          ? AppColors.PrimaryBlueColor
                          : AppColors.unFocusPrimaryColor,
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
