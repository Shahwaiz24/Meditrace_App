import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/back_ground_service.dart';
import 'package:meditrace_project/Services/global_Data.dart';
import 'package:meditrace_project/Services/utils.dart';

class NotificationService {
  static Future<void> sendNotification(String medicineName, String time) async {
    int id = BackGroundService.id;

  
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: BackGroundService.id,
          color: Colors.white,
          channelKey: 'notification_channel',
          title: 'Missed a dose? Don’t worry—take your\n ${medicineName} now.',
          icon: "resource://mipmap/ic_launcher",
          backgroundColor: Color.fromARGB(255, 237, 238, 238),
          customSound: 'resource://raw/bell_notification',
          wakeUpScreen: true,
          fullScreenIntent: true,
          notificationLayout: NotificationLayout.Default,
          criticalAlert: true,
        ),
        actionButtons: [
          NotificationActionButton(
            color: Colors.black, key: 'SNOOZE',
            label: 'Snooze',
            autoDismissible:
                false, // Keeps the notification even after pressing snooze
            actionType: ActionType.KeepOnTop, // Keeps notification on top
          ),
          NotificationActionButton(
            key: 'TAKE',
            label: 'Take',
            autoDismissible: true, // Dismisses the notification after pressing
            actionType: ActionType.KeepOnTop, // Keeps notification on top
          )
        ]);
  }

  // Function to check if it's time for medicine
  static void checkMedicineTimes() async {
    final currentTime = DateTime.now();

    for (var i = 0; i < UserGlobalData.userMedicines.length; i++) {
      String medicineName =
          UserGlobalData.userMedicines[i]['medicine_name'] ?? 'Unknown';
      String medicineTime = UserGlobalData.userMedicines[i]['time'] ?? '';
      DateTime? parsedTime = await _parseMedicineTime(medicineTime);
      if (parsedTime != null &&
          currentTime.hour == parsedTime.hour &&
          currentTime.minute == parsedTime.minute) {
        // If time matches, send notification
        await sendNotification(medicineName, medicineTime);
      } else if (parsedTime != null &&
          currentTime.hour != parsedTime.hour &&
          currentTime.minute != parsedTime.minute) {
        BackGroundService.id++;
      }
    }

    for (var medicine in UserGlobalData.userMedicines) {
      String medicineName = medicine['medicine_name'] ?? 'Unknown';
      String medicineTime = medicine['time'] ?? '';

      DateTime? parsedTime = _parseMedicineTime(medicineTime);

      if (parsedTime != null &&
          currentTime.hour == parsedTime.hour &&
          currentTime.minute == parsedTime.minute) {
        // If time matches, send notification
        sendNotification(medicineName, medicineTime);
        BackGroundService.id++;
      }
    }
  }

  // Function to parse time string to DateTime
  static DateTime? _parseMedicineTime(String time) {
    try {
      return DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        int.parse(time.split(":")[0]),
        int.parse(time.split(":")[1].split(" ")[0]),
      );
    } catch (e) {
      return null;
    }
  }
}
