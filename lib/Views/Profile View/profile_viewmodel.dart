import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileViewmodel with ChangeNotifier {
  int calculateAge(String dob) {
    // Define the input format of the date
    DateFormat dateFormat = DateFormat('d-MM-yyyy');

    // Parse the input date string into a DateTime object
    DateTime birthDate = dateFormat.parse(dob);

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Calculate age
    int age = currentDate.year - birthDate.year;

    // Adjust age if the birthday hasn't occurred yet this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}