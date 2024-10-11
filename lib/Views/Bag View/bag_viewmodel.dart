import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/global_data.dart';
import 'package:meditrace_project/Views/Profile%20View/profile_view.dart';

class BagViewmodel with ChangeNotifier {
  nameGet(){
    UserGlobalData.username = UserGlobalData.userData['firstname'] +
              " " +
              UserGlobalData.userData['lastname'] ?? "";
  }
   onAvatarClick({required BuildContext context,required Map user_data}) {
    UserGlobalData.selectedBottomBarIndex = 3;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) =>  ProfileView(userData: user_data,)),
      (Route<dynamic> route) => false,
    );
  }
}