import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meditrace_project/Services/local_storage.dart';
import 'package:meditrace_project/Services/notification_service.dart'; // Required for Android specific service

class BackGroundService {
  static initializing() async {
    await _createNotificationChannel(); // Create notification channel
    await _initializeLocalNotifications(); // Initialize notifications with a valid drawable icon
    await BackGroundService.initializeService();
    await LocalStorage.initialized();
  }

  static Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'my_foreground_channel', // ID
      'Background Service Channel', // Name
      description:
          'This channel is used for background service notifications', // Description
      importance: Importance.low, // Set appropriate importance
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // Local notification initialization with proper drawable icon
  static Future<void> _initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher'); // Use a drawable icon

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await NotificationService.flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static Future<bool> onStart(ServiceInstance service) async {
     // Show notification immediately
    print("Background service running at ${DateTime.now()}");
    // // Schedule periodic check for medicine times
    Timer.periodic(const Duration(seconds: 6), (timer) async {
      print("Background service running at ${DateTime.now()}");

     await Future.microtask(() async {
        // Run your task here asynchronously
         NotificationService.checkMedicineTimes();  // Keep it non-blocking
      });
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
        notificationChannelId: 'my_foreground_channel', // Channel ID
        initialNotificationTitle:
            'Meditrace Service Active', // Foreground notification title
        initialNotificationContent:
            'Checking Medicines ', // Notification content
        foregroundServiceNotificationId: 888, // Notification ID
      ),
      iosConfiguration: IosConfiguration(
        autoStart: true,
        onBackground: onStart,
      ),
    );

    print("Services Configured");
  }
}
