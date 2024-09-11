import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/utils.dart';

class SplashViewmodel with ChangeNotifier {
  bool _animate = false;
  bool _showButtons = false;

  bool get animate => _animate;
  bool get showButtons => _showButtons;

  void startAnimation() {
    _animate = true;
    notifyListeners();
  }

  void showNewColumn() {
    _showButtons = true;
    notifyListeners();
  }

  void animating() async {
    await Future.delayed(const Duration(seconds: 4), () {
      startAnimation();
      // Delay before showing the new column with buttons
      Future.delayed(const Duration(seconds: 1), () {
        showNewColumn();
      });
    });
  }

  Widget buildAnimatedButtons({
    required double screenHeight,
    required double screenWidth,
    required bool animate,
    required bool showButtons,
  }) {
    return AnimatedPositioned(
      duration: const Duration(seconds: 1),
      top: showButtons
          ? (screenHeight - (screenWidth * 0.7 * 0.3 + 40)) /
              2 // Calculate based on button height and spacing
          : screenHeight, // Move off-screen when not showing
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: const Duration(seconds: 1),
        opacity: showButtons ? 1.0 : 0.0,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: screenWidth * 0.7,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Sign In action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.ButtonBackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: screenWidth * 0.7,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Sign Up action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.ButtonBackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
