import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:meditrace_project/Services/global_Data.dart';

class NotificationService {

  static Future<void> sendNotification(String medicineName, String time) async {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      // largeIcon: "asset://assets/images/notification_icon.png",
      // icon: "asset://assets/images/notification_icon.png",

// customSound: 'resource://raw/bell_notification',
      id: 10,
      channelKey: 'notification_channel',
      // hideLargeIconOnExpand: true,
      actionType: ActionType.Default,
      // roundedLargeIcon: true,
      notificationLayout: NotificationLayout.Default,
      title: 'Missed a dose? Don’t worry—take your\n ${medicineName} now.',
    ));
   
  }

  // Function to check if it's time for medicine
  static void checkMedicineTimes() {
    final currentTime = DateTime.now();

    for (var medicine in UserGlobalData.userMedicines) {
      String medicineName = medicine['medicine_name'] ?? 'Unknown';
      String medicineTime = medicine['time'] ?? '';

      DateTime? parsedTime = _parseMedicineTime(medicineTime);

      if (parsedTime != null &&
          currentTime.hour == parsedTime.hour &&
          currentTime.minute == parsedTime.minute) {
        // If time matches, send notification
        sendNotification(medicineName, medicineTime);
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
