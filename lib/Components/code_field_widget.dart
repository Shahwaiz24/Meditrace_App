import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/utils.dart';

class CodeFieldWidget extends StatelessWidget {
  const CodeFieldWidget(
      {super.key, required this.screenHeight, required this.screenWidth});

  final double screenHeight;
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.unFocusPrimaryColor.withOpacity(0.5)),
        // width: 10,
        child: Center(
            child: Text(
          "+1",
          style: TextStyle(
              color: AppColors.TextblackColor,
              fontFamily: "Poppins Bold",
              fontSize: screenHeight * 0.016),
        )));

    //  Container(
    //   width: screenWidth * 0.040,
    //   height: screenHeight * 0.065,
    //   decoration: BoxDecoration(
    //     color: AppColors.unFocusPrimaryColor,
    //   ),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       Container(
    //           decoration: BoxDecoration(
    //               color: AppColors.unFocusPrimaryColor.withOpacity(0.5)),
    //           // width: 10,
    //           child: Center(
    //               child: Text(
    //             "+1",
    //             style: TextStyle(
    //                 color: AppColors.TextblackColor,
    //                 fontFamily: "Poppins Bold",
    //                 fontSize: screenHeight * 0.016),
    //           ))),
    //       // SizedBox(width: screenWidth * 0.010,),
    //     ],
    //   ),
    // );
  }
}
