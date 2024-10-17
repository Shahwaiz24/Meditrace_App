import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Time%20View/TIme%20Picker%20View/time_picker_viewmodel.dart';
import 'package:provider/provider.dart';

class TimePicker extends StatelessWidget {
  final Function(int hour, int minute, String period) onChanged;
  double screenheight;
  double screenwidth;

  TimePicker(
      {required this.onChanged,
      required this.screenheight,
      required this.screenwidth});

  final List<int> hours = List.generate(12, (index) => index + 1); // 1-12 hours
  final List<int> minutes = List.generate(60, (index) => index); // 0-59 minutes
  final List<String> ampm = ["AM", "PM"]; // AM or PM

  @override
  Widget build(BuildContext context) {
    return Consumer<TimePickerViewmodel>(builder: (context, model, child) {
      return Container(
        height: screenheight * 0.300,
        width: screenwidth * 0.400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hour picker
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: screenheight * 0.050,
                physics: FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  model.updateHour(hours[index]);
                  // Correctly format the hour, minute, and period using padded minute
                  onChanged(model.selectedHour, model.selectedMinute,
                      model.selectedPeriod);
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    bool isSelected = hours[index] == model.selectedHour;
                    return Center(
                      child: Text(
                        hours[index].toString().padLeft(2, '0'),
                        style: TextStyle(
                          fontFamily: isSelected == true
                              ? "Poppins Semi Bold"
                              : "Poppins Regular",
                          fontSize: isSelected
                              ? screenheight * 0.040
                              : screenheight * 0.020,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? AppColors.TextblackColor
                              : AppColors.unFocusPrimaryColor,
                        ),
                      ),
                    );
                  },
                  childCount: hours.length,
                ),
              ),
            ),
            // Separator between hour and minute
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                ':',
                style: TextStyle(
                    fontSize: screenheight * 0.030,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Minute picker
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: screenheight * 0.050,
                physics: FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  model.updateMinute(minutes[index]);
                  // Correctly format the hour, minute, and period using padded minute
                  onChanged(model.selectedHour, model.selectedMinute,
                      model.selectedPeriod);
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    bool isSelected = minutes[index] == model.selectedMinute;
                    return Center(
                      child: Text(
                        minutes[index]
                            .toString()
                            .padLeft(2, '0'), // Correctly pad minute
                        style: TextStyle(
                          fontFamily: isSelected == true
                              ? "Poppins Semi Bold"
                              : "Poppins Regular",
                          fontSize: isSelected
                              ? screenheight * 0.040
                              : screenheight * 0.020,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? AppColors.TextblackColor
                              : AppColors.unFocusPrimaryColor,
                        ),
                      ),
                    );
                  },
                  childCount: minutes.length,
                ),
              ),
            ),
            // AM/PM picker
            Expanded(
              child: ListWheelScrollView.useDelegate(
                itemExtent: screenheight * 0.050,
                physics: FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  model.updatePeriod(ampm[index]);
                  // Correctly format the hour, minute, and period using padded minute
                  onChanged(model.selectedHour, model.selectedMinute,
                      model.selectedPeriod);
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (context, index) {
                    bool isSelected = ampm[index] == model.selectedPeriod;

                    return Center(
                      child: Text(
                        ampm[index],
                        style: TextStyle(
                          fontFamily: isSelected == true
                              ? "Poppins Semi Bold"
                              : "Poppins Regular",
                          fontSize: isSelected
                              ? screenheight * 0.025
                              : screenheight * 0.020,
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? AppColors.TextblackColor
                              : AppColors.unFocusPrimaryColor,
                        ),
                      ),
                    );
                  },
                  childCount: ampm.length,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
