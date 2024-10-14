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
    // AM/PM Index based on isAm boolean
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
            hourController,
            12,
            (index) {
              int selectedHour = (index + 1) % 12;
              if (!isAm && selectedHour < 12) {
                selectedHour += 12;
              }
              onTimeChanged(DateTime(0, 0, 0, selectedHour, initialMinute));
            },
            (index) => (index + 1).toString().padLeft(2, '0'),
            'HH',
            const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          // Minute Picker
          _buildPicker(
            minuteController,
            60,
            (index) {
              onTimeChanged(DateTime(0, 0, 0, initialHour, index));
            },
            (index) => index.toString().padLeft(2, '0'),
            'MM',
            BorderRadius.zero,
          ),
          // AM/PM Picker
          _buildPicker(
            ampmController,
            2,
            (index) {
              bool isNowAm = index == 0;
              int currentHour = initialHour;
              if (isNowAm && currentHour >= 12) {
                currentHour -= 12;
              } else if (!isNowAm && currentHour < 12) {
                currentHour += 12;
              }
              onTimeChanged(DateTime(0, 0, 0, currentHour, initialMinute));
            },
            (index) => index == 0 ? 'AM' : 'PM',
            'AM/PM',
            const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPicker(
    FixedExtentScrollController controller,
    int itemCount,
    ValueChanged<int> onSelectedItemChanged,
    String Function(int) formatLabel,
    String semanticLabel,
    BorderRadius borderRadius,
  ) {
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
                return Container(
                  alignment: Alignment.center,
                  child: TimeTileWidget(
                    time: formatLabel(index),
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

  const TimeTileWidget({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(
          time,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
        ),
      ),
    );
  }
}
