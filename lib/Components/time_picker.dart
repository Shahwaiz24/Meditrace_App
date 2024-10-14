import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final int initialHour;
  final int initialMinute;
  final bool isAm;
  final ValueChanged<DateTime> onTimeChanged;

  const TimePicker({
    Key? key,
    required this.initialHour,
    required this.initialMinute,
    required this.isAm,
    required this.onTimeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int amPmIndex = isAm ? 0 : 1;

    // Initializing controllers based on initial time provided
    final FixedExtentScrollController hourController =
        FixedExtentScrollController(initialItem: initialHour % 12);
    final FixedExtentScrollController minuteController =
        FixedExtentScrollController(initialItem: initialMinute);
    final FixedExtentScrollController ampmController =
        FixedExtentScrollController(initialItem: amPmIndex);

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Hour Picker
          _buildPicker(
            controller: hourController,
            itemCount: 12,
            currentItem: initialHour % 12,
            onSelectedItemChanged: (index) {
              int selectedHour = (index + 1) % 12;
              if (!isAm && selectedHour < 12) {
                selectedHour += 12;
              }
              onTimeChanged(DateTime(0, 0, 0, selectedHour, initialMinute));
            },
            formatLabel: (index) => (index + 1).toString().padLeft(2, '0'),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          // Minute Picker
          _buildPicker(
            controller: minuteController,
            itemCount: 60,
            currentItem: initialMinute,
            onSelectedItemChanged: (index) {
              onTimeChanged(DateTime(0, 0, 0, initialHour, index));
            },
            formatLabel: (index) => index.toString().padLeft(2, '0'),
            borderRadius: BorderRadius.zero,
          ),
          // AM/PM Picker
          _buildPicker(
            controller: ampmController,
            itemCount: 2,
            currentItem: amPmIndex,
            onSelectedItemChanged: (index) {
              bool isNowAm = index == 0;
              int currentHour = initialHour;
              if (isNowAm && currentHour >= 12) {
                currentHour -= 12;
              } else if (!isNowAm && currentHour < 12) {
                currentHour += 12;
              }
              onTimeChanged(DateTime(0, 0, 0, currentHour, initialMinute));
            },
            formatLabel: (index) => index == 0 ? 'AM' : 'PM',
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPicker({
    required FixedExtentScrollController controller,
    required int itemCount,
    required int currentItem,
    required ValueChanged<int> onSelectedItemChanged,
    required String Function(int) formatLabel,
    required BorderRadius borderRadius,
  }) {
    return SizedBox(
      width: 75,
      height: 150,
      child: Stack(
        children: [
          ListWheelScrollView.useDelegate(
            controller: controller,
            itemExtent: 40,
            diameterRatio: 1.2,
            offAxisFraction: 0,
            onSelectedItemChanged: onSelectedItemChanged,
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                bool isSelected = index == currentItem;
                return Container(
                  alignment: Alignment.center,
                  child: TimeTileWidget(
                    time: formatLabel(index),
                    isSelected: isSelected,
                  ),
                );
              },
              childCount: itemCount,
            ),
          ),
          Center(
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius: borderRadius,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeTileWidget extends StatelessWidget {
  final String time;
  final bool isSelected;

  const TimeTileWidget({
    Key? key,
    required this.time,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          time,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: isSelected ? Colors.black : Colors.grey,
              ),
        ),
      ),
    );
  }
}
