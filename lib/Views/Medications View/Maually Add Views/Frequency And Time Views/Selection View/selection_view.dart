import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Selection%20View/selection_viewmodel.dart';
import 'package:provider/provider.dart';

class SelectionView extends StatelessWidget {
  const SelectionView(
      {super.key,
      required this.isAsNeeded,
      required this.isSpecific,
      required this.isEverday});

  final bool isSpecific;
  final bool isEverday;
  final bool isAsNeeded;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SelectionViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    model.checkFields(isInit: true);
    return Scaffold(
      backgroundColor: AppColors.ScaffoldColor,
      resizeToAvoidBottomInset: false,
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
            Text(
              'When will you take this',
              style: TextStyle(
                  color: AppColors.PrimaryBlueColor,
                  fontFamily: 'Poppins Medium',
                  fontSize: screenHeight * 0.016),
            ),
            SizedBox(height: screenHeight * 0.010),
            Text(
              "Add Frequency and Time",
              style: TextStyle(
                  color: AppColors.TextblackColor,
                  fontFamily: 'Poppins Bold',
                  fontSize: screenHeight * 0.020),
            ),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<SelectionViewmodel>(
              builder: (context, model, child) {
                return InkWell(
                  onTap: () {
                    model.frequency(context: context);
                  },
                  child: ButtonComponent(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      ButtonHeight: 0.080,
                      decoration: BoxDecoration(
                          color:
                              AppColors.DropDownUnfocusColor.withOpacity(0.4),
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.040)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.040),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Frequency",
                              style: TextStyle(
                                  color: AppColors.TextblackColor,
                                  fontFamily: 'Poppins Medium',
                                  fontSize: screenHeight * 0.019),
                            ),
                            const Spacer(),
                            SelectionViewmodel.isFrequencyCompleted == true
                                ? isAsNeeded == true
                                    ? Row(
                                        children: [
                                          Text(
                                            "As needed",
                                            style: TextStyle(
                                                color: AppColors
                                                    .unFocusPrimaryColor,
                                                fontFamily: "Poppins Regular",
                                                fontSize: screenHeight * 0.020),
                                          ),
                                          SizedBox(
                                            width: screenWidth * 0.010,
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_right_rounded,
                                            size: screenHeight * 0.035,
                                            color: AppColors.TextblackColor,
                                          )
                                        ],
                                      )
                                    : isEverday == true
                                        ? Row(
                                            children: [
                                              Text("Everyday",
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .unFocusPrimaryColor,
                                                      fontFamily:
                                                          "Poppins Regular",
                                                      fontSize: screenHeight *
                                                          0.020)),
                                              SizedBox(
                                                width: screenWidth * 0.010,
                                              ),
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                size: screenHeight * 0.035,
                                                color: AppColors.TextblackColor,
                                              )
                                            ],
                                          )
                                        : isSpecific == true
                                            ? Row(
                                                children: [
                                                  Text("Specific",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .unFocusPrimaryColor,
                                                          fontFamily:
                                                              "Poppins Regular",
                                                          fontSize:
                                                              screenHeight *
                                                                  0.020)),
                                                  SizedBox(
                                                    width: screenWidth * 0.010,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .keyboard_arrow_right_rounded,
                                                    size: screenHeight * 0.035,
                                                    color: AppColors
                                                        .TextblackColor,
                                                  )
                                                ],
                                              )
                                            : Text("")
                                : Icon(
                                    Icons.check_circle_outline_outlined,
                                    size: screenHeight * 0.032,
                                    color: AppColors.unFocusPrimaryColor,
                                  )
                          ],
                        ),
                      )),
                );
              },
            ),
           
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<SelectionViewmodel>(
              builder: (context, model, child) {
                return InkWell(
                  child: ButtonComponent(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      ButtonHeight: 0.080,
                      decoration: BoxDecoration(
                          color:
                              AppColors.DropDownUnfocusColor.withOpacity(0.4),
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.040)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.040),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Time",
                              style: TextStyle(
                                  color: AppColors.TextblackColor,
                                  fontFamily: 'Poppins Medium',
                                  fontSize: screenHeight * 0.019),
                            ),
                            const Spacer(),
                            SelectionViewmodel.isTimeCompleted == true
                                ? Icon(
                                    Icons.check_circle_rounded,
                                    size: screenHeight * 0.032,
                                    color: AppColors.AppTextColor1,
                                  )
                                : Icon(
                                    Icons.check_circle_outline_outlined,
                                    size: screenHeight * 0.032,
                                    color: AppColors.unFocusPrimaryColor,
                                  )
                          ],
                        ),
                      )),
                );
              },
            ),
            const Spacer(),
            Consumer<SelectionViewmodel>(builder: (context, model, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (model.isFieldsFill == true) {}
                      },
                      child: ButtonComponent(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          ButtonHeight: 0.075,
                          decoration: BoxDecoration(
                              color: model.isFieldsFill == true
                                  ? AppColors.PrimaryBlueColor
                                  : AppColors.unFocusPrimaryColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.080)),
                          child: Center(
                            child: Text(
                              'Next',
                              style: TextStyle(
                                  color: AppColors.TextwhiteColor,
                                  fontFamily: 'Poppins Semi Bold',
                                  fontSize: screenHeight * 0.020),
                            ),
                          )),
                    ),
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
