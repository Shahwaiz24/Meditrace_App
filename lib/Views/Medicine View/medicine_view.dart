import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/bottom_bar.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Medicine%20View/medicine_viewmodel.dart';
import 'package:provider/provider.dart';

class MedicineView extends StatelessWidget {
  const MedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MedicineViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar:
          BottomNavBar(screenHeight: screenHeight, screenWidth: screenWidth),
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
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                          color: AppColors.PrimaryBlueColor,
                          fontFamily: 'Poppins Medium',
                          fontSize: screenHeight * 0.018),
                    ),
                    SizedBox(height: screenHeight * 0.010),
                    Text(
                      'Tanya Sen!',
                      style: TextStyle(
                          color: AppColors.TextblackColor,
                          fontFamily: 'Poppins Bold',
                          fontSize: screenHeight * 0.020),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    model.onAvatarClick(context: context);
                  },
                  child: CircleAvatar(
                      maxRadius: screenHeight * 0.030,
                      backgroundColor: Colors.white,
                      child: UserGlobalData.userProfilePhoto.isEmpty
                          ? ImageIcon(
                              AssetImage(
                                'assets/images/icon/bottom_bar_icon/profile.png',
                              ),
                              size: screenHeight * 0.03,
                              color: AppColors.PrimaryBlueColor,
                            )
                          : Image(
                              image:
                                  NetworkImage(UserGlobalData.userProfilePhoto),
                              fit: BoxFit.cover,
                            )),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            Text(
              'My Medicines',
              style: TextStyle(
                  color: AppColors.TextblackColor,
                  fontFamily: 'Poppins Semi Bold',
                  fontSize: screenHeight * 0.018),
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            Row(
              children: [
                Icon(
                  Icons.add_box_rounded,
                  color: AppColors.PrimaryBlueColor,
                  size: screenHeight * 0.032,
                ),
                SizedBox(
                  width: screenWidth * 0.020,
                ),
                Text(
                  'Add New Medicine',
                  style: TextStyle(
                      color: AppColors.PrimaryBlueColor,
                      fontFamily: 'Poppins Medium',
                      fontSize: screenHeight * 0.016),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.150,
            ),
            Center(
              child: Text(
                'Set up your smart bag to view Medicine here!',
                style: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                    fontSize: screenHeight * 0.017),
              ),
            )
          ],
        ),
      ),
    );
  }
}
