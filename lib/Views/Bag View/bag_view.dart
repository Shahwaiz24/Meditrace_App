import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/bottom_bar.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Bag%20View/bag_viewmodel.dart';
import 'package:provider/provider.dart';

class BagView extends StatelessWidget {
  const BagView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BagViewmodel>(context);
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
                const CircleAvatar(
                  backgroundColor: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            Text(
              'My Bag',
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
                  'Add New Bag',
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
                'Set up your smart bag to view details here!',
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