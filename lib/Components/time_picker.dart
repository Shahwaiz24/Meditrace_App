import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final Function(int hour, int minute, String period) onChanged;

  TimePicker({required this.onChanged});

  final List<int> hours = List.generate(12, (index) => index + 1); // 1-12 hours
  final List<int> minutes = List.generate(60, (index) => index); // 0-59 minutes
  final List<String> ampm = ["AM", "PM"]; // AM or PM

  @override
  Widget build(BuildContext context) {
    // To keep track of the selected values
    int selectedHour = 5;
    int selectedMinute = 30;
    String selectedPeriod = "AM";

    return Container(
      height: 300,
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Hour picker
          Expanded(
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              physics: FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                selectedHour = hours[index];
                onChanged(selectedHour, selectedMinute, selectedPeriod);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  bool isSelected = hours[index] == selectedHour;
                  return Center(
                    child: Text(
                      hours[index].toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: isSelected ? 24 : 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.black : Colors.grey,
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Minute picker
          Expanded(
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              physics: FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                selectedMinute = minutes[index];
                onChanged(selectedHour, selectedMinute, selectedPeriod);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  bool isSelected = minutes[index] == selectedMinute;
                  return Center(
                    child: Text(
                      minutes[index].toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: isSelected ? 24 : 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.black : Colors.grey,
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
              itemExtent: 50,
              physics: FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                selectedPeriod = ampm[index];
                onChanged(selectedHour, selectedMinute, selectedPeriod);
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  bool isSelected = ampm[index] == selectedPeriod;
                  return Center(
                    child: Text(
                      ampm[index],
                      style: TextStyle(
                        fontSize: isSelected ? 24 : 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.black : Colors.grey,
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
  }
}
