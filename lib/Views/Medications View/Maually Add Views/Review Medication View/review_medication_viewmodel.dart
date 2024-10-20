import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/api_service.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Home%20View/home_view.dart';

import '../Frequency And Time Views/Selection View/selection_viewmodel.dart';

class ReviewMedicationViewmodel with ChangeNotifier {
  bool isSelected = false;
  bool isError = false;
  bool isLoading = false;

  close({required BuildContext context}) {
    SelectionViewmodel.isFrequencyCompleted = false;
    SelectionViewmodel.isTimeCompleted = false;

    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeView()));
  }

  addMedicine(
      {required String userId,
      required List medicines,
      required BuildContext context,
      required medicineToAdd}) async {
    isLoading = true;
    isSelected = false;
    notifyListeners();
    final List allMedicine = medicines;
    allMedicine.add(medicineToAdd);
    final map = {"userId": userId, " medicine": allMedicine};
    var jsonMap = jsonEncode(map);

    bool apiRequest = await ApiService.addMedicine(body: jsonMap);
    if (apiRequest == true) {
      isLoading = false;
      isSelected = false;
      SelectionViewmodel.isFrequencyCompleted = false;
      SelectionViewmodel.isTimeCompleted = false;
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
    } else {
      isLoading = false;
      isSelected = false;
      isError = true;
      notifyListeners();
      await Future.delayed(Duration(milliseconds: 1500));
      isError = false;
      notifyListeners();
    }
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
