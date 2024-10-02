import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

}