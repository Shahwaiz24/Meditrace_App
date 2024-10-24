import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Review%20Medication%20View/review_medication_viewmodel.dart';
import 'package:provider/provider.dart';

class ReviewMedicationView extends StatelessWidget {
  const ReviewMedicationView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ReviewMedicationViewmodel>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    model.initFunc();
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
                Text(
                  'Check if the data is correct',
                  style: TextStyle(
                      color: AppColors.PrimaryBlueColor,
                      fontFamily: 'Poppins Medium',
                      fontSize: screenHeight * 0.016),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    model.close(context: context);
                  },
                  child: Icon(
                    Icons.close,
                    size: screenHeight * 0.030,
                    color: AppColors.TextblackColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.010),
            Text(
              "Review Medication",
              style: TextStyle(
                  color: AppColors.TextblackColor,
                  fontFamily: 'Poppins Bold',
                  fontSize: screenHeight * 0.020),
            ),
            SizedBox(
              height: screenHeight * 0.030,
            ),
            ButtonComponent(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                ButtonHeight: 0.080,
                decoration: BoxDecoration(
                    color: AppColors.DropDownUnfocusColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(screenWidth * 0.040)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.040),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            color: AppColors.TextblackColor,
                            fontFamily: 'Poppins Medium',
                            fontSize: screenHeight * 0.019),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text("${MedicineAddingData.medicinesName}",
                              style: TextStyle(
                                  color: AppColors.unFocusPrimaryColor,
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
                    ],
                  ),
                )),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            ButtonComponent(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                ButtonHeight: 0.080,
                decoration: BoxDecoration(
                    color: AppColors.DropDownUnfocusColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(screenWidth * 0.040)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.040),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Strength",
                        style: TextStyle(
                            color: AppColors.TextblackColor,
                            fontFamily: 'Poppins Medium',
                            fontSize: screenHeight * 0.019),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                              "${MedicineAddingData.medicinesStrength} ${MedicineAddingData.medicinesUnit}",
                              style: TextStyle(
                                  color: AppColors.unFocusPrimaryColor,
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
                    ],
                  ),
                )),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            ButtonComponent(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                ButtonHeight: 0.080,
                decoration: BoxDecoration(
                    color: AppColors.DropDownUnfocusColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(screenWidth * 0.040)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.040),
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
                      Row(
                        children: [
                          Text(model.checkBool(),
                              style: TextStyle(
                                  color: AppColors.unFocusPrimaryColor,
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
                    ],
                  ),
                )),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            ButtonComponent(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
                ButtonHeight: 0.080,
                decoration: BoxDecoration(
                    color: AppColors.DropDownUnfocusColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(screenWidth * 0.040)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenWidth * 0.040),
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
                      Row(
                        children: [
                          Text(model.checkTime(),
                              style: TextStyle(
                                  color: AppColors.unFocusPrimaryColor,
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
                    ],
                  ),
                )),
            model.isError == true
                ? Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.020,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                            size: screenHeight * 0.030,
                          ),
                          SizedBox(
                            width: screenWidth * 0.020,
                          ),
                          Text(
                            "An Error Occured While Adding your \nMedication",
                            style: TextStyle(
                                color: AppColors.TextblackColor,
                                fontFamily: "Poppins Medium",
                                fontSize: screenHeight * 0.018),
                          )
                        ],
                      )
                    ],
                  )
                : Text(""),
            const Spacer(),
            Consumer<ReviewMedicationViewmodel>(
                builder: (context, model, child) {
              return InkWell(
                onTap: () {
                  if (model.isError == false) {
                    model.addMedicine(
                        userId: UserGlobalData.userId,
                        medicines: UserGlobalData.userData["medicines"],
                        context: context,
                        medicineToAdd: model.data);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                  child: ButtonComponent(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                      ButtonHeight: 0.075,
                      decoration: BoxDecoration(
                          color: model.isLoading == true
                              ? AppColors.unFocusPrimaryColor
                              : AppColors.PrimaryBlueColor,
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.080)),
                      child: model.isLoading == true
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.TextwhiteColor,
                              ),
                            )
                          : Center(
                              child: Text(
                                'Add to Medications',
                                style: TextStyle(
                                    color: AppColors.TextwhiteColor,
                                    fontFamily: 'Poppins Semi Bold',
                                    fontSize: screenHeight * 0.020),
                              ),
                            )),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
