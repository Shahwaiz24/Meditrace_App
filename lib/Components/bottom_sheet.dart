import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/utils.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key, required this.screenHeight, required this.screenWidth});

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.060),
      decoration: BoxDecoration(
        color: AppColors.TextwhiteColor,
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.060)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.015),
            child: Container(
              height: screenHeight * 0.005,
              width: screenWidth * 0.150,
              decoration: BoxDecoration(
                  color: AppColors.BagContainer.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(screenWidth * 0.050)),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.030,
          ),
          ButtonComponent(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            ButtonHeight: 0.070,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.020),
                border:
                    Border.all(color: AppColors.unFocusPrimaryColor, width: 1)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.040),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.camera_alt_rounded,
                    color: AppColors.PrimaryBlueColor,
                    size: screenHeight * 0.030,
                  ),
                  SizedBox(
                    width: screenWidth * 0.020,
                  ),
                  Text(
                    'Take Photo',
                    style: TextStyle(
                        color: AppColors.TextblackColor,
                        fontSize: screenHeight * 0.018,
                        fontFamily: "Poppins Medium"),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.020),
          ButtonComponent(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            ButtonHeight: 0.070,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(screenWidth * 0.020),
                border:
                    Border.all(color: AppColors.unFocusPrimaryColor, width: 1)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.040),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.folder_open_outlined,
                    color: AppColors.PrimaryBlueColor,
                    size: screenHeight * 0.030,
                  ),
                  SizedBox(
                    width: screenWidth * 0.020,
                  ),
                  Text(
                    'Upload from Photos',
                    style: TextStyle(
                        color: AppColors.TextblackColor,
                        fontSize: screenHeight * 0.018,
                        fontFamily: "Poppins Medium"),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.020,
          ),
          Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.030),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: AppColors.PrimaryBlueColor,
                      fontFamily: "Poppins Bold",
                      fontSize: screenHeight * 0.018),
                ),
              ))
        ],
      ),
    );
  }
}
