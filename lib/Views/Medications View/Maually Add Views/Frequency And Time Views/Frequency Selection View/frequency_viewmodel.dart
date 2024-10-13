import 'package:flutter/material.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Frequency%20And%20Time%20Views/Selection%20View/selection_view.dart';

class FrequencyViewmodel with ChangeNotifier {
  bool isSelected = false;
  bool isEverday = false;
  bool isSpecific = false;
  bool isAsNeeded = false;

  navigateToPop({required BuildContext context}) {
    isSelected = false;
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const SelectionView()));
  }

  ontap({required String whichField}) {
    if (whichField == "everyday") {
      isSpecific = false;
      isAsNeeded = false;
      isEverday = true;
      notifyListeners();
    } else if (whichField == "specific") {
      isSpecific = true;
      isAsNeeded = false;
      isEverday = false;
      notifyListeners();
    } else {
      isSpecific = false;
      isAsNeeded = true;
      isEverday = false;
      notifyListeners();
    }
  }

  checkallfields() {
    if ((isEverday == true) || (isSpecific == true) || (isAsNeeded == true)) {
      isSelected = true;
      notifyListeners();
    }else{
            isSelected = false;
      notifyListeners();
    }
  }
}
