import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Services/utils.dart';

class CustomDatePicker extends StatefulWidget {
  final bool isDateOfBirth;
  final bool isDialogOpen;
  final ValueChanged<String> onSelect;

  const CustomDatePicker({
    Key? key,
    required this.isDateOfBirth,
    required this.onSelect,
    required this.isDialogOpen,
  }) : super(key: key);

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
      lastAllowedDate = DateTime.now(); // Today's date is the max for DoB
    } else {
      firstAllowedDate =
          DateTime.now(); // Today's date is the min for future events
      lastAllowedDate = DateTime(2100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isDialogOpen ? _buildDialog(context) : _buildPicker(context);
  }

  // Build method for showing dialog
  Widget _buildDialog(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      insetPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.030),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenHeight * 0.010),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: _buildPicker(context),
        ),
      ),
    );
  }

  // Build method for showing date picker
  Widget _buildPicker(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = mediaQuery.size.width;
    final textScaleFactor = mediaQuery.textScaleFactor;

    final gridItemSize = screenWidth * 0.1; // Responsive size for date cells
    final paddingHorizontal = screenWidth * 0.005; // 5% of screen width padding
    final fontSize = textScaleFactor * 16; // Responsive font size for text

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100], // Light background color
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.020),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: _canGoToPreviousMonth() ? _previousMonth : null,
                icon: Icon(
                  Icons.keyboard_arrow_left_outlined,
                  size: screenHeight * 0.040,
                ),
                color: _canGoToPreviousMonth() ? Colors.black : Colors.grey,
              ),
              Text(
                DateFormat.yMMMM().format(focusedDate),
                style: TextStyle(
                  fontSize: fontSize * 1.2,
                  fontFamily: 'Poppins Regular',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: _canGoToNextMonth() ? _nextMonth : null,
                icon: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: screenHeight * 0.040,
                ),
                color: _canGoToNextMonth()
                    ? Colors.black
                    : Colors.grey, // Disable if navigation is blocked
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.010),
          // Days of the week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Sun', style: _buildDayLabelStyle(screenHeight)),
              Text('Mon', style: _buildDayLabelStyle(screenHeight)),
              Text('Tue', style: _buildDayLabelStyle(screenHeight)),
              Text('Wed', style: _buildDayLabelStyle(screenHeight)),
              Text('Thu', style: _buildDayLabelStyle(screenHeight)),
              Text('Fri', style: _buildDayLabelStyle(screenHeight)),
              Text('Sat', style: _buildDayLabelStyle(screenHeight)),
            ],
          ),
          SizedBox(height: screenHeight * 0.010),
          // Date Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.020),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, // 7 days in a row
                childAspectRatio: gridItemSize / (gridItemSize * 1.2),
              ),
              itemCount: _filteredDaysInMonth(focusedDate).length,
              itemBuilder: (context, index) {
                final day = _filteredDaysInMonth(focusedDate)[index];

                return GestureDetector(
                  onTap: () => _onDateSelected(day),
                  child: Container(
                    margin: EdgeInsets.all(screenWidth * 0.01),
                    alignment: Alignment.center,
                    child: Text(
                      "${day.day}",
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight:
                            day == selectedDate ? FontWeight.w600 : null,
                        fontFamily: 'Poppins Regular',
                        color: day == selectedDate
                            ? AppColors
                                .PrimaryBlueColor // Selected date in blue
                            : AppColors
                                .unFocusPrimaryColor, // Regular dates in black
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

  TextStyle _buildDayLabelStyle(double screenHeight) {
    return TextStyle(
      color: Colors.black,
      fontFamily: 'Poppins Regular',
      fontWeight: FontWeight.w600,
      fontSize: screenHeight * 0.018,
    );
  }

  // Helper Functions

  List<DateTime> _filteredDaysInMonth(DateTime date) {
    final daysInMonth = _daysInMonth(date);
    List<DateTime> validDates = [];

    for (int day = 1; day <= daysInMonth; day++) {
      final currentDay = DateTime(date.year, date.month, day);
      bool isDisabled = widget.isDateOfBirth
          ? currentDay.isAfter(lastAllowedDate)
          : currentDay.isBefore(firstAllowedDate);

      if (!isDisabled) {
        validDates.add(currentDay);
      }
    }

    return validDates;
  }

  int _daysInMonth(DateTime date) {
    final firstDayOfNextMonth = (date.month < 12)
        ? DateTime(date.year, date.month + 1, 1)
        : DateTime(date.year + 1, 1, 1);
    return firstDayOfNextMonth.subtract(const Duration(days: 1)).day;
  }

  // Prevent user from going forward when isDateOfBirth is true
  bool _canGoToNextMonth() {
    if (widget.isDateOfBirth) {
      return focusedDate.year != lastAllowedDate.year ||
          focusedDate.month != lastAllowedDate.month;
    }
    return true;
  }

  // Prevent user from going backward when isDateOfBirth is false
  bool _canGoToPreviousMonth() {
    if (!widget.isDateOfBirth) {
      return focusedDate.year != firstAllowedDate.year ||
          focusedDate.month != firstAllowedDate.month;
    }
    return true;
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
      String finalDate =
          DateFormat('d-MM-yyyy').format(selectedDate).toString();

      widget.onSelect(finalDate);
      // Print the selected date in "day-month-year" format
      print("Selected Date : ${finalDate}");
    });
  }
}
