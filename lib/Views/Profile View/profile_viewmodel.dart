import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Services/local_storage.dart';
import 'package:meditrace_project/Views/Profile%20Update%20View/profile_update_view.dart';
import 'package:meditrace_project/Views/Settings%20View/setting_view.dart';
import 'package:meditrace_project/Views/Splash%20View/splash_view.dart';

class ProfileViewmodel with ChangeNotifier {
  bool isLoading = false;

  String userAge = '';
  String userFullname = "";
  String userfirstName = '';
  String userLastName = "";
  String userWeight = '';
  String userHeight = "";
  String userBloodGroup = "";

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

  logoutTap({required BuildContext context}) async {
    UserGlobalData.selectedBottomBarIndex = 0;
    await LocalStorage.logoutUser();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SplashView()),
      (Route<dynamic> route) => false,
    );
  }

  lbsToKg(lbs) {
    const double conversionFactor = 0.45359237;
    final weight = lbs * conversionFactor;
    weightinKg = weight.toStringAsFixed(1);
    print(weightinKg);
  }

  initStateFunction() async {
    isLoading = true;
    double? lbstokg; // Changed to nullable type
    int? lbstokgint; // Changed to nullable type

    final String lbs =
        UserGlobalData.userData['medical_Information']['weight'].toString();

    userBloodGroup = UserGlobalData.userData['medical_Information']
            ['blood_Group']
        .toString();
    final String height =
        UserGlobalData.userData['medical_Information']['height'].toString();

// Using a regular expression to extract the number
    final RegExp heightexp = RegExp(
        r'([-+]?[0-9]*\.?[0-9]+)'); // Matches integers and decimal numbers
    final heightmatch = heightexp.firstMatch(height);

    if (heightmatch != null) {
      String numberString =
          heightmatch.group(0) ?? ''; // Extract the matched number

      // Store the numeric value as double
      userHeight = double.tryParse(numberString)
          .toString(); // This will parse the number and handle both integers and doubles
    } else {
      print('No valid number found in height string.');
    }

// Print the result

// Using a regular expression to extract the number
    final RegExp regExp = RegExp(
        r'([-+]?[0-9]*\.?[0-9]+)'); // Matches integers and decimal numbers
    final match = regExp.firstMatch(lbs);

    if (match != null) {
      String numberString = match.group(0) ?? ''; // Extract the matched number

      // Check if the extracted number is an integer or a double
      if (numberString.contains('.')) {
        // It's a double
        lbstokg = double.parse(numberString);
        userWeight = lbstokg.toString();
        await lbsToKg(lbstokg);
      } else {
        // It's an integer
        lbstokgint = int.parse(numberString);
        userWeight = lbstokgint.toString();
        await lbsToKg(lbstokgint);
      }
    } else {
      print('No valid number found in lbs string.');
    }

// Print values
    print(
        "double Value : ${lbstokg} | int Value : ${lbstokgint} | Height : ${userHeight} ");

    final dateofBirth = UserGlobalData.userData['birthDate'];

    await calculateAge(dateofBirth);
    userfirstName = UserGlobalData.userData['firstname'].toString();
    userLastName = UserGlobalData.userData['lastname'].toString();
    userFullname = userfirstName + " " + userLastName;
    print('Good');
    isLoading = false;
    notifyListeners();
  }

  navigateToUpdateProfile({required BuildContext context}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileUpdateView()));
  }

  navigateToSettings({required BuildContext context}) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SettingView()));
  }
}
