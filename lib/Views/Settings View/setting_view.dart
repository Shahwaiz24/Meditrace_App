import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Settings%20View/setting_viewmodel.dart';
import 'package:provider/provider.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingViewmodel>(context, listen: false);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.060,
          right: screenWidth * 0.060,
          top: screenHeight * 0.100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                          'Settings',
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
              height: screenHeight * 0.040,
            ),
            InkWell(
              onTap: () {
                model.onMyAccountTap(context: context);
              },
              child: ButtonComponent(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  ButtonHeight: 0.065,
                  decoration: BoxDecoration(
                      color: AppColors.BagContainer.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(screenWidth * 0.040)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    child: Row(
                      children: [
                        Text(
                          "My Account",
                          style: TextStyle(
                              color: AppColors.TextblackColor,
                              fontFamily: "Poppins Medium",
                              fontSize: screenHeight * 0.020),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: AppColors.TextblackColor,
                          size: screenHeight * 0.04,
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            InkWell(
              onTap: () {
                model.onNotificationsTap(context: context);
              },
              child: ButtonComponent(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  ButtonHeight: 0.065,
                  decoration: BoxDecoration(
                      color: AppColors.BagContainer.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(screenWidth * 0.040)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    child: Row(
                      children: [
                        Text(
                          "Notifications",
                          style: TextStyle(
                              color: AppColors.TextblackColor,
                              fontFamily: "Poppins Medium",
                              fontSize: screenHeight * 0.020),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: AppColors.TextblackColor,
                          size: screenHeight * 0.04,
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            InkWell(
              onTap: () {
                model.onHelpTap(context: context);
              },
              child: ButtonComponent(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  ButtonHeight: 0.065,
                  decoration: BoxDecoration(
                      color: AppColors.BagContainer.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(screenWidth * 0.040)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    child: Row(
                      children: [
                        Text(
                          "Help",
                          style: TextStyle(
                              color: AppColors.TextblackColor,
                              fontFamily: "Poppins Medium",
                              fontSize: screenHeight * 0.020),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: AppColors.TextblackColor,
                          size: screenHeight * 0.04,
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            InkWell(
              onTap: () {
                model.onConditionsTap(context: context);
              },
              child: ButtonComponent(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  ButtonHeight: 0.065,
                  decoration: BoxDecoration(
                      color: AppColors.BagContainer.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(screenWidth * 0.040)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    child: Row(
                      children: [
                        Text(
                          "Terms and conditions",
                          style: TextStyle(
                              color: AppColors.TextblackColor,
                              fontFamily: "Poppins Medium",
                              fontSize: screenHeight * 0.020),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: AppColors.TextblackColor,
                          size: screenHeight * 0.04,
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
