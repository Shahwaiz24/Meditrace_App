import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Services/utils.dart';

class GridviewMedicines extends StatelessWidget {
  const GridviewMedicines(
      {super.key, required this.screenHeight, required this.screenWidth});
  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(0),
        itemCount: 4,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: screenWidth * 0.020,
            mainAxisExtent: screenHeight * 0.100,
            mainAxisSpacing: screenHeight * 0.010),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                left: screenHeight * 0.020, right: screenHeight * 0.020),
            child: ButtonComponent(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              ButtonHeight: 0.050,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.040),
                  color: AppColors.PrimaryBlueColor.withOpacity(0.1)),
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.020,
                  right: screenWidth * 0.020,
                  left: screenWidth * 0.020,
                  // bottom: screenHeight * 0.020,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Ibuprofen ",
                          // UserGlobalData.userMedicines[index]['medicine_name']
                          // .toString(),
                          style: TextStyle(
                              color: AppColors.TextblackColor,
                              fontFamily: 'Poppins Semi Bold',
                              fontSize: screenHeight * 0.016),
                        ),
                        SizedBox(
                          width: screenWidth * 0.005,
                        ),
                        Text(
                          '400 mg',
                          style: TextStyle(
                              color: AppColors.unFocusPrimaryColor,
                              fontFamily: 'Poppins Medium',
                              fontSize: screenHeight * 0.015),
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.010,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
