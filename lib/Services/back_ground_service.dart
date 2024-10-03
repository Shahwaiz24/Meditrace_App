import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meditrace_project/Services/local_storage.dart';
import 'package:meditrace_project/Services/notification_service.dart'; // Required for Android specific service

class BackGroundService {
  static initializing() async {
    // Initializing BackGround Services and Notification Services
    final permissionGranted = await NotificationService
        .flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();

    await NotificationService.flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings(
            '@mipmap/ic_launcher'), // Use your launcher icon or another icon
      ),
    );
    await BackGroundService.initializeService();
    await LocalStorage.initialized();
  }

  static Future<bool> onStart(ServiceInstance service) async {
    // Show notification immediately

    // Schedule periodic check for medicine times
    Timer.periodic(const Duration(seconds: 6), (timer) async {
      print("Background service running at ${DateTime.now()}");

      // NotificationService.checkMedicineTimes();
    });
    return true;
  }

  static Future<void> initializeService() async {
    final service = await FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
        notificationChannelId:
            'my_foreground_channel', // Use the same channel ID
        initialNotificationTitle: '', // Use an empty string instead of null
        initialNotificationContent: '', // Remove the content
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
