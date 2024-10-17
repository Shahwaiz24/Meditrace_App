import 'package:flutter/material.dart';
import 'package:meditrace_project/Components/button.dart';
import 'package:meditrace_project/Components/time_picker.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Time%20View/TIme%20Picker%20View/time_picker_viewmodel.dart';
import 'package:provider/provider.dart';

class TimePickerView extends StatelessWidget {
  const TimePickerView({super.key, required this.isSecond});

  final bool isSecond;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TimePickerViewmodel>(context);
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
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.060,
            ),
            Consumer<TimePickerViewmodel>(builder: (context, model, child) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.020),
                  border: Border.all(
                      color: AppColors.unFocusPrimaryColor, width: 1),
                ),
                height: screenHeight * 0.400,
                child: Center(
                  child: TimePicker(
                    screenheight: screenHeight,
                    screenwidth: screenWidth,
                    onChanged: (hour, minute, period) {
                      String formattedMinute =
                          minute.toString().padLeft(2, '0');
                      model.changedTime(
                          hour: hour, minute: formattedMinute, period: period);
                    },
                  ),
                ),
              );
            }),
            const Spacer(),
            Consumer<TimePickerViewmodel>(builder: (context, model, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.030),
                child: InkWell(
                  onTap: () {
                    model.saveFunction(context: context, second: isSecond);
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
                        'Save',
                        style: TextStyle(
                            color: AppColors.TextwhiteColor,
                            fontFamily: 'Poppins Semi Bold',
                            fontSize: screenHeight * 0.020),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
