import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/app_logo.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Splash%20View/splash_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Provider.of<SplashViewmodel>(context, listen: false)
        .animating(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final model = Provider.of<SplashViewmodel>(context, listen: false);

    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      body: Stack(
        children: [
          // Positioned widgets to animate vertically
          Consumer<SplashViewmodel>(
            builder: (context, animationProvider, child) {
              return AnimatedPositioned(
                duration: const Duration(seconds: 2),
                top: animationProvider.animate
                    ? screenHeight * 0.15 // Target position after animation
                    : screenHeight * 0.4, // Initial centered position
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: animationProvider.animate
                      ? 0.0
                      : 1.0, // Fade out after animation
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      AppLogo(
                        screenheight: screenHeight,
                        screenwidth: screenWidth,
                        imageHeight: animationProvider.animate ? 0.100 : 0.130,
                      ),
                      SizedBox(height: screenHeight * 0.020),

                      // App title (Medi + trace)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Medi',
                            style: TextStyle(
                              color: AppColors.AppTextColor1,
                              fontSize: animationProvider.animate
                                  ? screenHeight * 0.038
                                  : screenHeight * 0.045,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins Semi Bold',
                            ),
                          ),
                          Text(
                            'trace',
                            style: TextStyle(
                              color: AppColors.AppTextColor2,
                              fontSize: animationProvider.animate
                                  ? screenHeight * 0.038
                                  : screenHeight * 0.045,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Poppins Semi Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // Animated buttons
          Consumer<SplashViewmodel>(
            builder: (context, animationProvider, child) {
              return animationProvider.buildAnimatedButtons(
                context: context,
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                animate: animationProvider.animate,
                showButtons: animationProvider.showButtons,
              );
            },
          ),
        ],
      ),
    );
  }
}
