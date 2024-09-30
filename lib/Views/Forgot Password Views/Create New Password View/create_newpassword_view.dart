import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/text_fields.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Forgot%20Password%20Views/Create%20New%20Password%20View/create_newpassword_viewmodel.dart';
import 'package:provider/provider.dart';

class CreateNewpasswordView extends StatelessWidget {
  CreateNewpasswordView({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<CreateNewpasswordViewmodel>(context);
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
              "Forgot password?",
              style: TextStyle(
                  color: AppColors.PrimaryBlueColor,
                  fontFamily: 'Poppins Medium',
                  fontSize: screenHeight * 0.018),
            ),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            Text(
              "Create New Password",
              style: TextStyle(
                  fontFamily: "Poppins Bold",
                  fontSize: screenHeight * 0.020,
                  color: AppColors.TextblackColor),
            ),
            SizedBox(
              height: screenHeight * 0.010,
            ),
            Text("Update your password for enhanced account\nsecurity.",
                style: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: "Poppins Regular",
                    fontSize: screenHeight * 0.017)),
            SizedBox(
              height: screenHeight * 0.040,
            ),
            TextFields(
                controller: passwordController,
                enablefillColor: Colors.black,
                focusfillColor: model.isFocusPassword == true
                    ? AppColors.TextwhiteColor
                    : model.isPasswordNotEmpty == true
                        ? AppColors.TextwhiteColor
                        : AppColors.unFocusPrimaryColor.withOpacity(0.1),
                outlineColor: model.isError == true
                    ? Colors.red
                    : AppColors.unFocusPrimaryColor.withOpacity(0.5),
                radius: screenWidth * 0.020,
                isHidden: false,
                HintText: "Enter Password",

              
                hintStyle: TextStyle(
                  color: AppColors.unFocusPrimaryColor,

                  //  model.isError
                  //     ? Colors.red
                  //     : AppColors.unFocusPrimaryColor,

                  fontFamily: 'Poppins Regular',
                ),
                Prefix: Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.unFocusPrimaryColor.withOpacity(0.8),
                  size: screenHeight * 0.032,
                ),

                //  model.isFocusPassword
                //             ? const Icon(
                //                 Icons.lock_outline_rounded,
                //                 color: Colors.black,
                //               )
                //             : model.isPasswordNotEmpty == true ? const Icon(
                //                 Icons.lock_outline_rounded,
                //                 color: Colors.black,
                //               )  : Icon(
                //                 Icons.lock_outline_rounded,
                //                 color: AppColors.unFocusPrimaryColor
                //                     .withOpacity(0.8),
                //                 size: screenHeight * 0.032,
                //               ),
                Suffix: const Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.black,
                ),
                isSuffix: true,
                isNumberKeyboard: false,
                isPrefix: true,
                onFocus: (value) {},
                contentStyle: const TextStyle(
                    fontFamily: 'Poppins Regular', fontWeight: FontWeight.w500),
                onChanged: (value) {})
          ],
        ),
      ),
    );
  }
}
