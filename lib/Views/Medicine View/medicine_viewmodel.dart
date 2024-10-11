import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Medications%20View/Maually%20Add%20Views/Add%20Medication%20View/add_medication.dart';
import 'package:meditrace_project/Views/Profile%20View/profile_view.dart';

class MedicineViewmodel with ChangeNotifier {
  navigate({required BuildContext context}) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  AddMedication()),
    );
  }

  nameGet() {
    UserGlobalData.username = UserGlobalData.userData['firstname'] +
            " " +
            UserGlobalData.userData['lastname'] ??
        "";
  }

  onAvatarClick({required BuildContext context, required Map user_data}) {
    UserGlobalData.selectedBottomBarIndex = 3;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => ProfileView(
                userData: user_data,
              )),
      (Route<dynamic> route) => false,
    );
  }
}
