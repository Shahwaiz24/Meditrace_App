import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';

class ReviewMedicationViewmodel with ChangeNotifier {
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
