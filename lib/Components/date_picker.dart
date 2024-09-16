import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final bool isDateOfBirth;
  final bool isDialogOpen;

  const CustomDatePicker(
      {Key? key, required this.isDateOfBirth, required this.isDialogOpen})
      : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();
  late DateTime firstAllowedDate;
  late DateTime lastAllowedDate;
  DateTime focusedDate = DateTime.now(); // Month navigation control

  @override
  void initState() {
    super.initState();
    if (widget.isDateOfBirth) {
      firstAllowedDate = DateTime(1900);
      lastAllowedDate = DateTime.now();
    } else {
      firstAllowedDate = DateTime.now();
      lastAllowedDate = DateTime(2100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isDialogOpen ? _buildDialog(context) : _buildPicker(context);
  }

  // Build method for showing dialog
  Widget _buildDialog(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: _buildPicker(context),
                ),
              ),
            );
          },
        );
      },
      child: const Text("Open Date Picker"),
    );
  }

  // Build method for showing date picker
  Widget _buildPicker(BuildContext context) {
    // Get screen width and height for responsiveness
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final textScaleFactor = mediaQuery.textScaleFactor;

    final gridItemSize = screenWidth * 0.1; // Responsive size for date cells
    final paddingHorizontal =
        screenWidth * 0.05; // Horizontal padding as 5% of screen width
    final fontSize =
        textScaleFactor * 16; // Responsive font size based on text scale factor

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Column(
        children: [
          // Month and Year navigation bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _previousMonth,
                icon: Icon(Icons.arrow_back, size: screenWidth * 0.07),
              ),
              Text(
                DateFormat.yMMMM().format(focusedDate),
                style: TextStyle(
                  fontSize: fontSize * 1.2, // Slightly larger font for title
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: _nextMonth,
                icon: Icon(Icons.arrow_forward, size: screenWidth * 0.07),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Days of the week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text('Sun'),
              Text('Mon'),
              Text('Tue'),
              Text('Wed'),
              Text('Thu'),
              Text('Fri'),
              Text('Sat'),
            ],
          ),
          const SizedBox(height: 10),
          // Date Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, // 7 days in a row
                childAspectRatio: gridItemSize /
                    (gridItemSize * 1.2), // Adjust height slightly taller
              ),
              itemCount: _daysInMonth(focusedDate),
              itemBuilder: (context, index) {
                final day =
                    DateTime(focusedDate.year, focusedDate.month, index + 1);
                bool isDisabled = widget.isDateOfBirth
                    ? day.isAfter(lastAllowedDate)
                    : day.isBefore(firstAllowedDate);

                return GestureDetector(
                  onTap: !isDisabled ? () => _onDateSelected(day) : null,
                  child: Container(
                    margin: EdgeInsets.all(screenWidth * 0.01),
                    decoration: BoxDecoration(
                      color: day == selectedDate
                          ? Colors.teal
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDisabled ? Colors.grey : Colors.teal,
                        width:
                            screenWidth * 0.005, // Responsive border thickness
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(
                        fontSize:
                            fontSize, // Responsive font size for day numbers
                        color: isDisabled ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper Functions

  int _daysInMonth(DateTime date) {
    final firstDayOfNextMonth = (date.month < 12)
        ? DateTime(date.year, date.month + 1, 1)
        : DateTime(date.year + 1, 1, 1);
    return firstDayOfNextMonth.subtract(const Duration(days: 1)).day;
  }

  void _previousMonth() {
    setState(() {
      focusedDate = DateTime(focusedDate.year, focusedDate.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      focusedDate = DateTime(focusedDate.year, focusedDate.month + 1);
    });
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }
}
