import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meditrace_project/Services/global_Data.dart';
import 'package:meditrace_project/Services/utils.dart';

class NotificationService {
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static AndroidNotificationDetails androidPlatformChannelSpecifics =
//      const AndroidNotificationDetails(
//           'my_foreground_channel', // Channel ID
//           'Foreground Service', // Channel name
//           channelDescription:
//               'This notification indicates the background service is running.',
//           importance: Importance.max,
//           priority: Priority.high,
//           icon: '@mipmap/ic_launcher',
//           sound: const RawResourceAndroidNotificationSound('bell_notification'),
//           styleInformation: BigTextStyleInformation(
//             "",
//             htmlFormatContent: true,
//             htmlFormatTitle: true,
//           ));

//   // Define notification details for iOS
//   static const DarwinNotificationDetails iosPlatformChannelSpecifics =
//       DarwinNotificationDetails(
//     presentAlert: true,
//     presentBadge: true,
//     sound: 'bell_notification',
//     presentSound: true,
//   );

//   // Combine notification details for both platforms
//   static NotificationDetails platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//     iOS: iosPlatformChannelSpecifics,
//   );
// Notification sending function
  static Future<void> sendNotification(String medicineName, String time) async {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
      
      icon: "asset://assets/images/notification_icon.png",

      // customSound: 'assets/notification_sound/bell_notification.mp3',
      id: 10,
      channelKey: 'notification_channel',
      actionType: ActionType.Default,
      notificationLayout: NotificationLayout.Messaging,
      title: 'Missed a dose? Don’t worry—take your\n ${medicineName} now.',
    ));
    // await flutterLocalNotificationsPlugin.show(
    //   0, // Notification ID
    //   '<div style="color: #434343; font-family: Poppins, sans-serif; font-size: 24px;">Missed a dose? Don’t worry—take your\n ${medicineName} now.</div>', // Notification Title
    //   '', // HTML styled body text
    //   platformChannelSpecifics,
    //   payload: 'Medication Alert', // Optional payload
    // );
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
