import 'package:flutter/material.dart';

class SettingViewmodel with ChangeNotifier {
  navigateToBack({required BuildContext context}) {
    Navigator.pop(context);
  }

  onMyAccountTap({required BuildContext context}) {
    print("Setting Up My Account Tap");
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => AccountView()));
  }

  onNotificationsTap({required BuildContext context}) {
    print("Setting Up Notification Tap");

    // Navigator.push(
    //   context, MaterialPageRoute(builder: (context) => NotificationsView()));
  }

  onHelpTap({required BuildContext context}) {
    print("Setting Up My Help Tap");

    // Navigator.push(
    //   context, MaterialPageRoute(builder: (context) => HelpView()));
  }

  onConditionsTap({required BuildContext context}) {
    print("Setting Up My Conditions Tap");

    // Navigator.push(
    //   context, MaterialPageRoute(builder: (context) => ConditionsView()));
  }
}
