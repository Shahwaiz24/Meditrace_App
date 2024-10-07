import 'package:flutter/material.dart';

class ChronicWidget extends StatelessWidget {
  final bool isChronicSelected;
  final List<String> selectedChronics; // Assume this list is populated
  final Function(String) onChronicDelete;

  ChronicWidget({
    required this.isChronicSelected,
    required this.selectedChronics,
    required this.onChronicDelete,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return isChronicSelected
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.020),
              child: Wrap(
                spacing: screenWidth * 0.010,
                children: selectedChronics.map((condition) {
                  return Chip(
                    label: Text(
                      condition,
                      style: TextStyle(
                        fontFamily: 'Poppins Regular',
                        color: Colors
                            .black, // Update this to AppColors.TextblackColor
                        fontSize: screenHeight * 0.020,
                      ),
                    ),
                    onDeleted: () {
                      onChronicDelete(condition); 
                    },
                    deleteIcon: const Icon(
                      Icons.close_rounded,
                      color: Colors
                          .black, // Update this to AppColors.TextblackColor
                    ),
                    backgroundColor:
                        Colors.white, // Update this to AppColors.TextwhiteColor
                  );
                }).toList(),
              ),
            ),
          )
        : Text("");
  }
}
