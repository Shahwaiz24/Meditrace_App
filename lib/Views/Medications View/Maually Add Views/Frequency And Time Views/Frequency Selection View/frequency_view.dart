import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/day_picker.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Frequency%20Selection%20View/frequency_viewmodel.dart';
import 'package:provider/provider.dart';

class FrequencyView extends StatelessWidget {
  const FrequencyView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FrequencyViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.ScaffoldColor,
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
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Frequency',
                          style: TextStyle(
                              color: AppColors.TextblackColor,
                              fontSize: screenHeight * 0.020,
                              fontFamily: "Poppins Bold"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            model.navigateToPop(context: context);
                          },
                          child: Icon(
                            size: screenHeight * 0.030,
                            Icons.arrow_back_ios_new,
                            color: AppColors.ButtonBackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
           
            SizedBox(
              height: screenHeight * 0.060,
            ),
            Consumer<FrequencyViewmodel>(
              builder: (context, model, child) {
                return InkWell(
                  onTap: () {
                    model.ontap(whichField: "everyday");
                    model.checkallfields();
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
                              "Everyday",
                              style: TextStyle(
                                  color: AppColors.TextblackColor,
                                  fontFamily: 'Poppins Medium',
                                  fontSize: screenHeight * 0.019),
                            ),
                            const Spacer(),
                            model.isEverday == true
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
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<FrequencyViewmodel>(
              builder: (context, model, child) {
                return InkWell(
                  onTap: () {
                    model.ontap(whichField: "specific");
                    model.checkallfields();
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
                              "Specific Days",
                              style: TextStyle(
                                  color: AppColors.TextblackColor,
                                  fontFamily: 'Poppins Medium',
                                  fontSize: screenHeight * 0.019),
                            ),
                            const Spacer(),
                            model.isSpecific == true
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
            SizedBox(
              height: screenHeight * 0.030,
            ),
            Consumer<FrequencyViewmodel>(
              builder: (context, model, child) {
                return InkWell(
                  onTap: () {
                    model.ontap(whichField: "");
                    model.checkallfields();
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
                              "As needed",
                              style: TextStyle(
                                  color: AppColors.TextblackColor,
                                  fontFamily: 'Poppins Medium',
                                  fontSize: screenHeight * 0.019),
                            ),
                            const Spacer(),
                            model.isAsNeeded == true
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
            Consumer<FrequencyViewmodel>(
              builder: (context, model, child) {
                return model.isSpecific == true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight * 0.020,
                          ),
                          Text(
                            "Choose Days",
                            style: TextStyle(
                              color: AppColors.TextblackColor,
                              fontSize: screenHeight * 0.020,
                              fontFamily: "Poppins Bold",
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.030,
                          ),
                          // Horizontal ListView.builder
                          SizedBox(
                            height: screenHeight *
                                0.050, // Adjust the height as per your needs
                            child: DayPicker(
                                selectedDays: model.selectedDays,
                                toggleDay: (day) {
                                  model.pickDay(day);
                                }),
                          ),
                        ],
                      )
                    : Text("");
              },
            ),
            const Spacer(),
            Consumer<FrequencyViewmodel>(builder: (context, model, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (model.isSelected == true) {
                          model.nextTap(context: context);
                        }
                      },
                      child: ButtonComponent(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          ButtonHeight: 0.075,
                          decoration: BoxDecoration(
                              color: model.isSelected == true
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
