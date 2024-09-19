import 'package:flutter/material.dart';
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
    final model = Provider.of<EmergencyContactViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Text(
              'Emergency Contact',
              style: TextStyle(
                color: AppColors.TextblackColor,
                fontFamily: 'Poppins Bold',
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
                  focusfillColor:
                      AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: AppColors.unFocusPrimaryColor,
                  radius: screenWidth * 0.020,
                  isHidden: false,
                  HintText: 'Contact Name',
                  hintStyle: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: Text(''),
                  Suffix: Text(''),
                  isSuffix: false,
                  isNumberKeyboard: false,
                  isPrefix: false,
                  onFocus: (focus) {},
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {});
            }),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<EmergencyContactViewmodel>(
                builder: (context, model, child) {
              return TextFields(
                  controller: contactNumberContrller,
                  enablefillColor: Colors.black,
                  focusfillColor:
                      AppColors.unFocusPrimaryColor.withOpacity(0.1),
                  outlineColor: AppColors.unFocusPrimaryColor,
                  radius: screenWidth * 0.020,
                  isHidden: false,
                  HintText: 'Contact Number',
                  hintStyle: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                  ),
                  Prefix: Text(''),
                  Suffix: Text(''),
                  isSuffix: false,
                  isNumberKeyboard: true,
                  isPrefix: false,
                  onFocus: (focus) {},
                  contentStyle: const TextStyle(
                      fontFamily: 'Poppins Regular',
                      fontWeight: FontWeight.w500),
                  onChanged: (value) {});
            }),
          ],
        ),
      ),
    );
  }
}
