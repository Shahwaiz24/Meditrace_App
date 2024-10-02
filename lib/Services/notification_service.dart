import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meditrace_project/Services/global_Data.dart';

class NotificationService {
   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
// Notification sending function
  static Future<void> sendNotification(String medicineName, String time) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'medication_channel', // channel ID
      'Medication Alerts', // channel name
      channelDescription: 'Channel for medication time alerts',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'Medicine Time Reached', // Notification Title
      'It\'s time to take your medicine: $medicineName at $time', // Notification Body
      platformChannelSpecifics,
      payload: 'Medication Alert', // Optional payload
    );
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