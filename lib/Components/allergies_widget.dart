import 'package:flutter/material.dart';

class AllergiesWidget extends StatelessWidget {
  final bool isAllergiesSelected;
  final List<String> selectedAllergies; // Assume this list is populated
  final Function(String) onAllergiesRemove;

  AllergiesWidget({
    required this.isAllergiesSelected,
    required this.selectedAllergies,
    required this.onAllergiesRemove,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return isAllergiesSelected
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenWidth * 0.020),
              child: Wrap(
                spacing: screenWidth * 0.010,
                children: selectedAllergies.map((condition) {
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
                      onAllergiesRemove(condition); // Toggle selection
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
