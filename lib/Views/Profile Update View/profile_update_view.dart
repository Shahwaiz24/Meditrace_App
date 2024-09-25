import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Profile%20Update%20View/profile_update_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfileUpdateView extends StatelessWidget {
  ProfileUpdateView({super.key});

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileUpdateViewmodel>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.ScaffoldColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.060,
          right: screenWidth * 0.060,
          top: screenHeight * 0.100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                              color: AppColors.TextblackColor,
                              fontSize: screenHeight * 0.022,
                              fontFamily: "Poppins Bold"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            size: screenHeight * 0.030,
                            Icons.arrow_back_ios_new,
                            color: AppColors.ButtonBackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.035,
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: CircleAvatar(
                  maxRadius: screenHeight * 0.060,
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            Center(
              child: Text('Edit Photo',
                  style: TextStyle(
                      color: AppColors.unFocusPrimaryColor,
                      fontFamily: "Poppins Regular",
                      fontSize: screenHeight * 0.017)),
            ),
            SizedBox(
              height: screenHeight * 0.050,
            ),
            // Text Fields Started //

            Consumer<ProfileUpdateViewmodel>(builder: (context, model, child) {
              return TextFields(
                  onFocus: (value) {
                    model.onFirstNameFocusChange(value);
                  },
                  controller: lastName,
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
                    // model.checkFirstNameEmpty(
                    //     firstName: firstNameController.text);
                    // model.checkallFields(
                    //   firstName: firstNameController.text,
                    //   lastName: lastNameController.text,
                    // );
                  });
            }),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<ProfileUpdateViewmodel>(builder: (context, model, child) {
              return TextFields(
                  onFocus: (value) {
                    model.onFirstLastFocusChange(value);
                  },
                  controller: lastName,
                  enablefillColor: Colors.black,
                  focusfillColor: model.isFocusLastName == true
                      ? AppColors.TextwhiteColor
                      : model.isLastNameNotEmpty == true
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
                    // model.checkFirstNameEmpty(
                    //     firstName: firstNameController.text);
                    // model.checkallFields(
                    //   firstName: firstNameController.text,
                    //   lastName: lastNameController.text,
                    // );
                  });
            }),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<ProfileUpdateViewmodel>(builder: (context, model, child) {
              return TextFields(
                  onFocus: (value) {
                    model.onEmailFocusChange(value);
                  },
                  controller: firstName,
                  enablefillColor: Colors.black,
                  focusfillColor: model.isFocusEmail == true
                      ? AppColors.TextwhiteColor
                      : model.isEmailNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: AppColors.unFocusPrimaryColor,
                  radius: screenWidth * 0.020,
                  isHidden: false,
                  HintText: 'Email Address',
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
                    // model.checkFirstNameEmpty(
                    //     firstName: firstNameController.text);
                    // model.checkallFields(
                    //   firstName: firstNameController.text,
                    //   lastName: lastNameController.text,
                    // );
                  });
            }),

            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<ProfileUpdateViewmodel>(builder: (context, model, child) {
              return TextFields(
                  onFocus: (value) {
                    model.onPhoneFocusChange(value);
                  },
                  controller: firstName,
                  enablefillColor: Colors.black,
                  focusfillColor: model.isFocusPhone == true
                      ? AppColors.TextwhiteColor
                      : model.isPhoneNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: AppColors.unFocusPrimaryColor,
                  radius: screenWidth * 0.020,
                  isHidden: false,
                  HintText: 'Phone Number',
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
                  isNumberKeyboard: true,
                  isPrefix: false,
                  onChanged: (value) {
                    // model.checkFirstNameEmpty(
                    //     firstName: firstNameController.text);
                    // model.checkallFields(
                    //   firstName: firstNameController.text,
                    //   lastName: lastNameController.text,
                    // );
                  });
            }),

            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<ProfileUpdateViewmodel>(builder: (context, model, child) {
              return TextFields(
                  onFocus: (value) {
                    model.onDateOfBirthFocusChange(value);
                  },
                  controller: firstName,
                  enablefillColor: Colors.black,
                  focusfillColor: model.isFocusDateofBirth == true
                      ? AppColors.TextwhiteColor
                      : model.isDateofBirthNotEmpty == true
                          ? AppColors.TextwhiteColor
                          : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: AppColors.unFocusPrimaryColor,
                  radius: screenWidth * 0.020,
                  isHidden: false,
                  HintText: 'Date Of Birth',
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
                    // model.checkFirstNameEmpty(
                    //     firstName: firstNameController.text);
                    // model.checkallFields(
                    //   firstName: firstNameController.text,
                    //   lastName: lastNameController.text,
                    // );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
