import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  DateTime focusedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    if (widget.isDateOfBirth) {
      // For Date of Birth, allow dates from 1900 up to today
      firstAllowedDate = DateTime(1900);
      lastAllowedDate = DateTime.now(); // Today's date is the max for DoB
    } else {
      // For other events, allow only future dates
      firstAllowedDate =
          DateTime.now(); // Today's date is the min for future events
      lastAllowedDate = DateTime(2100); // Infinite future allowed
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isDialogOpen ? _buildDialog(context) : _buildPicker(context);
  }

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

  Widget _buildPicker(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final textScaleFactor = mediaQuery.textScaleFactor;

    final gridItemSize = screenWidth * 0.1; // Responsive size for date cells
    final paddingHorizontal = screenWidth * 0.005; // 5% of screen width padding
    final fontSize = textScaleFactor * 16; // Responsive font size for text

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
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
              GestureDetector(
                onTap: () => _selectYear(context), // Open year selection
                child: Text(
                  DateFormat.yMMMM().format(focusedDate),
                  style: TextStyle(
                    fontSize: fontSize * 1.2,
                    fontFamily: 'Poppins Regular',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: _canGoToNextMonth() ? _nextMonth : null,
                icon: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: screenHeight * 0.040,
                ),
                color: _canGoToNextMonth() ? Colors.black : Colors.grey,
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

  void _selectYear(BuildContext context) {
    int currentYear = DateTime.now().year;
    int startYear;
    int endYear;

    // Determine the range of years based on isDateOfBirth
    if (widget.isDateOfBirth) {
      startYear = 1900; // Start from 1900 for date of birth
      endYear = currentYear; // Up to current year
    } else {
      startYear = currentYear + 1; // Only the current year
      endYear = 2100; // Allow future years
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Year'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: (endYear - startYear + 1), // Total years in range
              itemBuilder: (context, index) {
                int year = startYear + index; // Calculate the actual year
                return ListTile(
                  title: Text(year.toString()),
                  onTap: () {
                    setState(() {
                      focusedDate = DateTime(year, focusedDate.month);
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
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

  List<DateTime> _filteredDaysInMonth(DateTime date) {
    final today = DateTime.now();
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);

    List<DateTime> validDates = [];

    // Loop through each day in the current month
    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      final currentDay = DateTime(date.year, date.month, day);

      // Hide dates before today if isDateOfBirth is false
      if (!widget.isDateOfBirth && currentDay.isBefore(today)) {
        continue; // Skip days before today
      }

      // Only display the current day and future dates, starting from today's weekday
      if (currentDay
          .isAfter(today.subtract(Duration(days: today.weekday - 1)))) {
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

  bool _canGoToNextMonth() {
    if (widget.isDateOfBirth) {
      return focusedDate.year != lastAllowedDate.year ||
          focusedDate.month != lastAllowedDate.month;
    }
    return true;
  }

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
      print("Selected Date : ${finalDate}");
    });
  }
}
