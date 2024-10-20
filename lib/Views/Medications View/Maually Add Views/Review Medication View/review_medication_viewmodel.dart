import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Home%20View/home_view.dart';

import '../Frequency And Time Views/Selection View/selection_viewmodel.dart';

class ReviewMedicationViewmodel with ChangeNotifier {
  close({required BuildContext context}) {
    SelectionViewmodel.isFrequencyCompleted = false;
    SelectionViewmodel.isTimeCompleted = false;

    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeView()));
  }

  checkBool() {
    if (MedicineAddingData.isAsNeeded == true) {
      return "As Needed";
    } else if (MedicineAddingData.isEverday == true) {
      return "Everyday";
    } else {
      return "Specific";
    }
  }

  checkTime() {
    if (MedicineAddingData.isDose2Selected == true) {
      return "${MedicineAddingData.dose1Time},${MedicineAddingData.dose2Time}";
    } else {
      return "${MedicineAddingData.dose1Time}";
    }
  }
}
