import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/utils.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.clickImage,
    required this.pickImage,
  });

  final double screenHeight;
  final double screenWidth;
  final Future<XFile?> Function() pickImage; // Update type
  final Future<XFile?> Function() clickImage; // Update type

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
          SizedBox(height: screenHeight * 0.030),
          InkWell(
            onTap: () async {
              final XFile? image = await clickImage(); // Await for clickImage
              if (image != null) {
                print("Image :${image}");
              }
              Navigator.pop(
                  context); // Close the bottom sheet after image is taken
            },
            child: ButtonComponent(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              ButtonHeight: 0.070,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.020),
                  border: Border.all(
                      color: AppColors.unFocusPrimaryColor, width: 1)),
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
                    SizedBox(width: screenWidth * 0.020),
                    Text(
                      'Take Photo',
                      style: TextStyle(
                        color: AppColors.TextblackColor,
                        fontSize: screenHeight * 0.018,
                        fontFamily: "Poppins Medium",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.020),
          InkWell(
            onTap: () async {
              final XFile? image = await pickImage(); // Await for pickImage
              if (image != null) {
                // Handle the selected image here, if needed
                print("Image : ${image}");
              }
              Navigator.pop(
                  context); // Close the bottom sheet after image is picked
            },
            child: ButtonComponent(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              ButtonHeight: 0.070,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.020),
                  border: Border.all(
                      color: AppColors.unFocusPrimaryColor, width: 1)),
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
                    SizedBox(width: screenWidth * 0.020),
                    Text(
                      'Upload from Photos',
                      style: TextStyle(
                        color: AppColors.TextblackColor,
                        fontSize: screenHeight * 0.018,
                        fontFamily: "Poppins Medium",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.020),
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
                  fontSize: screenHeight * 0.018,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
