import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/api_service.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Services/local_storage.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Bag%20View/bag_view.dart';
import 'package:meditrace_project/Views/Home%20View/home_view.dart';
import 'package:meditrace_project/Views/Medicine%20View/medicine_view.dart';
import 'package:meditrace_project/Views/Profile%20View/profile_view.dart';

class HomeViewmodel with ChangeNotifier {
  bool isLoading = false;
  bool isError = false;
  bool called = false;
  String userName = "";

  static String? user_id = "";
  String day = '';
  String date = '';
  bool showContainer = false;
  double containerOpacity = 0.0;
  double medicines_text_opacity = 0.0;
  double progress_text_opacity = 0.0;
  double center_text_opacity = 0.0;

  onAvatarClick({required BuildContext context}) {
    UserGlobalData.selectedBottomBarIndex = 3;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => ProfileView(
                userData: UserGlobalData.userData,
              )),
      (Route<dynamic> route) => false,
    );
  }

  getUserData() async {
    isLoading = true;
    called = true;
    try {
      HomeViewmodel.user_id = await LocalStorage.getUserid();
      if (HomeViewmodel.user_id != null && HomeViewmodel.user_id!.isNotEmpty) {
        final Map forParseBody = {"user_Id": HomeViewmodel.user_id.toString()};
        var jsonBody = jsonEncode(forParseBody);
        bool apiCheck = await ApiService.getUserData(body: jsonBody);
        if (apiCheck == true) {
          await getDateandDay();
       userName = UserGlobalData.userData['firstname'] + " " + UserGlobalData.userData['lastname'];

          isLoading = false;
          notifyListeners();
          triggerFadeInAnimation();
        } else {
          isLoading = false;
          isError = true;
          notifyListeners();
        }
      }
    } on Exception catch (e) {
      print("Error : ${e.toString()}");
      isLoading = false;
      isError = true;
      notifyListeners();
    }
  }

  initStateFunction() async {
    if (called == true) {
    } else {
      print("Init Called");
      await getUserData();
    }
  }

  onBottomBarSelected({required int index, required BuildContext context}) {
    UserGlobalData.selectedBottomBarIndex = index;
    if (UserGlobalData.selectedBottomBarIndex == 0) {
      showContainer = false;
      isError = false;
      isLoading = false;
      called = false;
      containerOpacity = 0.0;
      medicines_text_opacity = 0.0;
      progress_text_opacity = 0.0;
      center_text_opacity = 0.0;
      progressValue = 0.0;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
        (Route<dynamic> route) => false,
      );
    } else if (UserGlobalData.selectedBottomBarIndex == 1) {
      print('Bag View');
      showContainer = false;
      isError = false;
      isLoading = false;
      called = false;
      containerOpacity = 0.0;
      medicines_text_opacity = 0.0;
      progress_text_opacity = 0.0;
      center_text_opacity = 0.0;
      progressValue = 0.0;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => BagView(
                  userData: UserGlobalData.userData,
                )),
        (Route<dynamic> route) => false,
      );
      print("Data : ${UserGlobalData.userData}");
    } else if (UserGlobalData.selectedBottomBarIndex == 2) {
      showContainer = false;
      isError = false;
      isLoading = false;
      called = false;
      containerOpacity = 0.0;
      medicines_text_opacity = 0.0;
      progress_text_opacity = 0.0;
      center_text_opacity = 0.0;
      progressValue = 0.0;
      print('Medicine View');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => MedicineView(
                  userData: UserGlobalData.userData,
                )),
        (Route<dynamic> route) => false,
      );
      print("Data : ${UserGlobalData.userData}");
    } else if (UserGlobalData.selectedBottomBarIndex == 3) {
      showContainer = false;
      isError = false;
      isLoading = false;
      called = false;
      containerOpacity = 0.0;
      medicines_text_opacity = 0.0;
      progress_text_opacity = 0.0;
      center_text_opacity = 0.0;
      progressValue = 0.0;
      print('Profile View');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileView(
                  userData: UserGlobalData.userData,
                )),
        (Route<dynamic> route) => false,
      );
      print("Data : ${UserGlobalData.userData}");
    }
    notifyListeners();
  }

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
  void triggerFadeInAnimation() async {
    print('Start Animatiion');

    await Future.delayed(const Duration(milliseconds: 100), () {
      showContainer = true;
    });

    await Future.delayed(const Duration(milliseconds: 100), () {
      containerOpacity = 1.0;
      startProgressAnimation();
    });
    await Future.delayed(const Duration(milliseconds: 100), () {
      medicines_text_opacity = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 100), () {
      progress_text_opacity = 1.0;
      notifyListeners();
    });
    await Future.delayed(const Duration(milliseconds: 100), () {
      center_text_opacity = 1.0;
      notifyListeners();
    });
  }

  // Animate the circular progress
  void startProgressAnimation() {
    Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      if (containerOpacity == 1.0) {
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
        ImageIcon(
          const AssetImage('assets/images/icon/medical_bag.png'),
          size: screenHeight * 0.04,
          color: AppColors.TextwhiteColor,
        ),
        // Icon(
        //   Icons.medical_services_outlined,
        //   size: screenHeight * 0.04,
        //   color: AppColors.TextwhiteColor,
        // ),
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

  Widget afterContainerAnimation({
    required double screenWidth,
    required double screenHeight,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedOpacity(
          opacity: medicines_text_opacity,
          duration: const Duration(seconds: 1),
          child: Text(
            'Today’s Medicines',
            style: TextStyle(
              color: AppColors.TextblackColor,
              fontFamily: 'Poppins Semi Bold',
              fontSize: screenHeight * 0.020,
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.010,
        ),
        AnimatedOpacity(
            opacity: progress_text_opacity,
            duration: const Duration(seconds: 1),
            child: Text(
              'Mark your daily progress here!',
              style: TextStyle(
                  color: AppColors.PrimaryBlueColor,
                  fontFamily: 'Poppins Regular',
                  fontSize: screenHeight * 0.017),
            )),
        SizedBox(
          height: screenHeight * 0.070,
        ),
        AnimatedOpacity(
            opacity: center_text_opacity,
            duration: const Duration(seconds: 1),
            child: Center(
              child: Text(
                'Set up your smart bag to display the\n                 medications here!',
                style: TextStyle(
                    color: AppColors.unFocusPrimaryColor,
                    fontFamily: 'Poppins Regular',
                    fontSize: screenHeight * 0.016),
              ),
            ))
      ],
    );
  }
}
