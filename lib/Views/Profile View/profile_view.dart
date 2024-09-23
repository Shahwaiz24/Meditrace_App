import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/bottom_bar.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Profile%20View/profile_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar:
          BottomNavBar(screenHeight: screenHeight, screenWidth: screenWidth),
      body: Stack(
        children: [
          Container(
            height: screenHeight * 0.5, // 50% of screen height
            decoration: BoxDecoration(
              color: AppColors.PrimaryBlueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(screenWidth * 0.060),
                bottomRight: Radius.circular(screenWidth * 0.060),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.100,
                right: screenWidth * 0.060,
                left: screenWidth * 0.060),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      const AssetImage('assets/images/icon/notification.png'),
                      size: screenHeight * 0.040,
                      color: AppColors.TextwhiteColor,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                          color: AppColors.TextwhiteColor,
                          fontFamily: 'Poppins Bold',
                          fontSize: screenHeight * 0.020),
                    ),
                    ImageIcon(
                        const AssetImage('assets/images/icon/chat_help.png'),
                        size: screenHeight * 0.040,
                        color: AppColors.TextwhiteColor),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.050,
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.AppTextColor1,
                                width: screenWidth * 0.005),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          maxRadius: screenHeight * 0.070,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.020,
                      ),
                      Text(
                        'Tanya Sen',
                        style: TextStyle(
                            color: AppColors.TextwhiteColor,
                            fontFamily: 'Poppins Semi Bold',
                            fontSize: screenHeight * 0.020),
                      ),
                      SizedBox(
                        height: screenHeight * 0.005,
                      ),
                      Text('50 Years',
                          style: TextStyle(
                              color: AppColors.TextwhiteColor,
                              fontFamily: 'Poppins Medium',
                              fontSize: screenHeight * 0.017))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
