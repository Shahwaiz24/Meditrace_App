import 'package:flutter/material.dart';
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
            TextFields(
                isMedical: true,
                controller: knownAllergiesController,
                enablefillColor: AppColors.unFocusPrimaryColor.withOpacity(0.1),
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
                onChanged: () {}),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            TextFields(
                isMedical: true,
                controller: chronicConditionsController,
                enablefillColor: AppColors.unFocusPrimaryColor.withOpacity(0.1),
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
                onChanged: () {}),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            TextFields(
                isMedical: true,
                controller: medicationsController,
                enablefillColor: AppColors.unFocusPrimaryColor.withOpacity(0.1),
                focusfillColor: AppColors.TextwhiteColor,
                outlineColor: model.isError
                    ? Colors.red.withOpacity(0.5)
                    : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                radius: screenHeight * 0.010,
                isHidden: false,
                HintText:
                    model.isError ? 'Enter Correct Medications' : 'Medications',
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
                onChanged: () {}),
          ],
        ),
      ),
    );
  }
}
