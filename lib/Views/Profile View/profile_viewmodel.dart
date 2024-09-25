import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meditrace_project/Views/Profile%20Update%20View/profile_update_view.dart';

class ProfileViewmodel with ChangeNotifier {
  bool isLoading = false;

  String userAge = '';
  String weightinKg = '';
  calculateAge(String dob) {
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

    userAge = age.toString();
  }

  lbsToKg(double lbs) {
    const double conversionFactor = 0.45359237;
    final weight = lbs * conversionFactor;
    weightinKg = weight.toStringAsFixed(1);
  }

  initStateFunction({required double lbs, required String dateofBirth}) async {
    isLoading = true;
    await lbsToKg(lbs);
    await calculateAge(dateofBirth);
    print('Good');
    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }

  navigateToUpdateProfile({required BuildContext context}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ProfileUpdateView()));
  }
}
