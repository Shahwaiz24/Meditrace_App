import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Time%20View/time_viewmodel.dart';
import 'package:provider/provider.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TimeViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Time',
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
                            model.navigatetoBack(context: context, isPop: true);
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
            Consumer<TimeViewmodel>(
              builder: (context, model, child) {
                return InkWell(
                  onTap: () {
                    model.selectDose1(context: context);
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
                              "Dose 1",
                              style: TextStyle(
                                  color: AppColors.TextblackColor,
                                  fontFamily: 'Poppins Medium',
                                  fontSize: screenHeight * 0.019),
                            ),
                            const Spacer(),
                            TimeViewmodel.isDose1Selected == true
                                ? Row(
                                    children: [
                                      Text(MedicineAddingData.dose1Time,
                                          style: TextStyle(
                                              color:
                                                  AppColors.unFocusPrimaryColor,
                                              fontFamily: "Poppins Regular",
                                              fontSize: screenHeight * 0.020)),
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
                                : Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    size: screenHeight * 0.035,
                                    color: AppColors.TextblackColor,
                                  )
                          ],
                        ),
                      )),
                );
              },
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            Consumer<TimeViewmodel>(builder: (context, model, child) {
              if (model.isSecondDoseEnable == true) {
                return InkWell(
                  onTap: () {
                    model.selectDose2(context: context);
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
                              "Dose 2",
                              style: TextStyle(
                                  color: AppColors.TextblackColor,
                                  fontFamily: 'Poppins Medium',
                                  fontSize: screenHeight * 0.019),
                            ),
                            const Spacer(),
                            TimeViewmodel.isDose2Selected == true
                                ? Row(
                                    children: [
                                      Text(MedicineAddingData.dose2Time,
                                          style: TextStyle(
                                              color:
                                                  AppColors.unFocusPrimaryColor,
                                              fontFamily: "Poppins Regular",
                                              fontSize: screenHeight * 0.020)),
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
                                : Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    size: screenHeight * 0.035,
                                    color: AppColors.TextblackColor,
                                  )
                          ],
                        ),
                      )),
                );
              } else {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        model.addDose2();
                      },
                      child: Icon(
                        Icons.add_box_rounded,
                        color: AppColors.PrimaryBlueColor,
                        size: screenHeight * 0.032,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.020,
                    ),
                    InkWell(
                      onTap: () {
                        model.addDose2();
                      },
                      child: Text(
                        'Add another dose',
                        style: TextStyle(
                            color: AppColors.PrimaryBlueColor,
                            fontFamily: 'Poppins Medium',
                            fontSize: screenHeight * 0.018),
                      ),
                    )
                  ],
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
