import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meditrace_project/Services/notification_service.dart'; // Required for Android specific service

class BackGroundService {
  static Future<bool> onStart(ServiceInstance service) async {
    // Create a notification channel
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      'my_foreground_channel', // id
      'Foreground Service', // title
      description:
          'This notification indicates the background service is running.',
      importance: Importance.max,
    );

    await NotificationService.flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Show notification immediately

    // Schedule periodic check for medicine times
    Timer.periodic(const Duration(seconds: 4), (timer) async {
      print("Background service running at ${DateTime.now()}");
      // NotificationService.checkMedicineTimes();
      await NotificationService.flutterLocalNotificationsPlugin.show(
        888, // Notification ID
        'Your Time to Get Medicine',
        'Medicine Name',
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'my_foreground_channel', // Ensure this matches the channel ID
            'Foreground Service',
            channelDescription:
                'This notification indicates the background service is running.',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
      );
    });
    return true;
  }

  static Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
        notificationChannelId:
            'my_foreground_channel', // Use the same channel ID
        initialNotificationTitle: 'Service Running',
        initialNotificationContent: 'Your service is active.',
        foregroundServiceNotificationId: 888,
      ),
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onBackground: onStart,
      ),
    );
    print("Services Configured");
  }
}
