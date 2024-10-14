import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/utils.dart';

class DayPicker extends StatelessWidget {
  final List<String> selectedDays;
  final Function(String) toggleDay;

  DayPicker({required this.selectedDays, required this.toggleDay});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // List of all days
    final List<String> allDays = [
      'Mon',
      'Tue',
      'Wed',
      'Thr',
      'Fri',
      'Sat',
      'Sun'
    ];

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: allDays.length,
      itemBuilder: (context, index) {
        String day = allDays[index];
        bool isSelected = selectedDays.contains(day);

        return GestureDetector(
          onTap: () => toggleDay(day),
          child: Container(
            margin: EdgeInsets.only(right: screenWidth * 0.022),
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.020, vertical: 0),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.BagContainer
                  : AppColors.unFocusPrimaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(screenWidth * 0.020),
            ),
            child: Center(
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.TextwhiteColor,
                  fontFamily: "Poppins Regular",
                  fontSize: screenHeight * 0.020,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
