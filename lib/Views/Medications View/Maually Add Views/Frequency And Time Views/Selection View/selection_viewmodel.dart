import 'package:flutter/material.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Frequency%20Selection%20View/frequency_view.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Time%20View/time_view.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Review%20Medication%20View/review_medication_view.dart';

class SelectionViewmodel with ChangeNotifier {
  bool isFieldsFill = false;

  static bool isFrequencyCompleted = false;
  static bool isTimeCompleted = false;

  next({required BuildContext context}) {
      isFrequencyCompleted = false;
      isTimeCompleted = false;
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const ReviewMedicationView()));
    
  }

  frequency({required BuildContext context}) {
    isFieldsFill = false;
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const FrequencyView()));
  }

  time({required BuildContext context}) {
    isFieldsFill = false;
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const TimeView()));
  }

  checkFields({required bool isInit}) {
    print("Checking");
    if ((isFrequencyCompleted == true) && (isTimeCompleted == true)) {
      isFieldsFill = true;
      if (isInit == false) {
        notifyListeners();
      }
    } else {
      isFieldsFill = false;
      if (isInit == false) {
        notifyListeners();
      }
    }
  }
}
