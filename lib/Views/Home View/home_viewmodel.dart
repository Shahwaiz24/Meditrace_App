import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/utils.dart';

class HomeViewmodel with ChangeNotifier {
  String day = '';
  String date = '';
  bool showContainer = false;
  double containerOpacity = 0.0;

  // Progress variables
  double progressValue = 0.0;
  bool showBorder = false;

  // Initialize date and time
  getDateandDay() async {
    DateTime now = DateTime.now();
    day = DateFormat('EEEE').format(now); // e.g., Wednesday
    date = DateFormat('d\'th\' MMMM, yyyy')
        .format(now); // e.g., 16th September, 2024
  }

  // Trigger the fade-in effect and start the progress animation
  void triggerFadeInAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2), () {
        showContainer = true;
      });

      await Future.delayed(const Duration(milliseconds: 100), () {
        containerOpacity = 1.0;
        startProgressAnimation(); // Start the progress bar animation
      });
    });
  }

  // Animate the circular progress
  void startProgressAnimation() {
    Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if(containerOpacity == 1.0){
        if (progressValue < 0.75) {
          // Stop at 75%
          progressValue += 0.05; // Increase progress
          notifyListeners();
        } else {
          // Once progress reaches 75%, show the circular border
          notifyListeners();
          timer.cancel(); // Stop the timer
        }
      }
     
    });
  }

  // Custom chart widget with the briefcase icon and circular border
  Widget _buildCustomChart(double screenWidth, double screenHeight) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Conditional border when progress is complete

        // Circular progress indicator with rounded ends
        SizedBox(
          height: screenHeight * 0.10,
          width: screenHeight * 0.10,
          child: CircularProgressIndicator(
            value: progressValue, 
            strokeWidth: screenWidth * 0.020,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.AppTextColor1),
            backgroundColor: Colors.grey[300],
            semanticsLabel: 'Profile Setup Progress',
          ),
        ),
       
        Icon(
          Icons.medical_services_outlined, // Briefcase icon
          size: screenHeight * 0.04,
          color: AppColors.TextwhiteColor,
        ),
      ],
    );
  }

  // Main animated container with the custom chart and other UI elements
  Widget getAnimatedContainer({
    required double screenWidth,
    required double screenHeight,
    required Color containerColor,
  }) {
    return AnimatedOpacity(
      opacity: containerOpacity,
      duration: const Duration(seconds: 3),
      child: showContainer
          ? Container(
              width: screenWidth,
              padding: EdgeInsets.all(screenWidth * 0.05),
              decoration: BoxDecoration(
                color: AppColors.BagContainer,
                borderRadius: BorderRadius.circular(screenWidth * 0.050),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Custom chart with the briefcase icon and circular border

                      // Text "Your Profile Setup is almost complete!"
                      Text(
                        'Your Profile Setup is\n almost complete!',
                        style: TextStyle(
                          color: AppColors.TextwhiteColor,
                          fontFamily: 'Poppins Semi Bold',
                          fontSize: screenHeight * 0.022,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.010),

                      // Subtitle: "Set up your Smart Bag!"
                      Text(
                        'Set up your Smart Bag!',
                        style: TextStyle(
                          color: AppColors.TextwhiteColor,
                          fontFamily: 'Poppins Regular',
                          fontSize: screenHeight * 0.018,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.020),

                      // Button: "Set up now"

                      ButtonComponent(
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        ButtonHeight: 0.050,
                        decoration: BoxDecoration(
                            color: AppColors.AppTextColor1,
                            // color: AppColors.TextblackColor,
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.080)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.060),
                            child: Text(
                              'Set up Now',
                              style: TextStyle(
                                color: AppColors.TextwhiteColor,
                                fontFamily: 'Poppins Regular',
                                fontSize: screenHeight * 0.018,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  _buildCustomChart(screenWidth, screenHeight),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
