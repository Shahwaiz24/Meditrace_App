import 'dart:async';
import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meditrace_project/Services/local_storage.dart';
import 'package:meditrace_project/Services/notification_service.dart';

class BackGroundService {
  static initializing() async {
    // await _createNotificationChannel(); // Create notification channel
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
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'notification_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            playSound: true,
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true,
    );

    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    // const AndroidInitializationSettings initializationSettingsAndroid =
    //     AndroidInitializationSettings(
    //         '@mipmap/ic_launcher'); // Use a drawable icon

    // final InitializationSettings initializationSettings =
    //     InitializationSettings(
    //   android: initializationSettingsAndroid,
    // );

    // await NotificationService.flutterLocalNotificationsPlugin.initialize(
    //   initializationSettings,
    // );
    // if(Platform.isAndroid == true){
    //  await NotificationService.flutterLocalNotificationsPlugin
    // .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();

    // }
    // await NotificationService.flutterLocalNotificationsPlugin
    // .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
    // ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  static Future<bool> onStart(ServiceInstance service) async {
    // Show notification immediately
    print("Background service running at ${DateTime.now()}");
    // // Schedule periodic check for medicine times
    Timer.periodic(const Duration(seconds: 6), (timer) async {
      print("Background service running at ${DateTime.now()}");

      await Future.microtask(() async {
        // Run your task here asynchronously
        NotificationService.checkMedicineTimes();
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
