import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Profile%20View/profile_view.dart';

class BagViewmodel with ChangeNotifier {
   onAvatarClick({required BuildContext context}) {
    UserGlobalData.selectedBottomBarIndex = 3;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const ProfileView()),
      (Route<dynamic> route) => false,
    );
  }
}