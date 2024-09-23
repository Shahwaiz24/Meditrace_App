import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Home%20View/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    final model = Provider.of<HomeViewmodel>(context, listen: false);
    model.getDateandDay();
    model.triggerFadeInAnimation(); // Start the fade-in animation
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      bottomNavigationBar: BottomNavBar(
        screenHeight: screenHeight,
        screenWidth: screenWidth,
      ),
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
            SizedBox(height: screenHeight * 0.020),
            Row(
              children: [
                Text(
                  '${model.day}, ',
                  style: TextStyle(
                      color: AppColors.unFocusPrimaryColor,
                      fontFamily: 'Poppins Medium',
                      fontSize: screenHeight * 0.017),
                ),
                Text(
                  model.date,
                  style: TextStyle(
                      color: AppColors.TextblackColor,
                      fontFamily: 'Poppins Medium',
                      fontSize: screenHeight * 0.017),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.040),

            // Animated container that fades in after 2 seconds
            Consumer<HomeViewmodel>(builder: (context, model, child) {
              return model.getAnimatedContainer(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                containerColor: AppColors.PrimaryBlueColor,
              );
            }),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Consumer<HomeViewmodel>(builder: (context, model, child) {
              return Expanded(
                child: model.afterContainerAnimation(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
