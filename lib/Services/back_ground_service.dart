import 'dart:async';
import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meditrace_project/Services/local_storage.dart';
import 'package:meditrace_project/Services/notification_service.dart';

class BackGroundService {
  static int id = 0;
  static initializing() async {
    await _initializeLocalNotifications(); // Initialize notifications with a valid drawable icon
    await BackGroundService.initializeService();
    await LocalStorage.initialized();
  }

  // Local notification initialization with proper drawable icon
  static Future<void> _initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
      "resource://mipmap/ic_launcher", // Ensure this is set correctly
      [
        NotificationChannel(
          
          channelGroupKey: 'basic_channel_group',
          channelKey: 'notification_channel', // Regular notification channel
          channelName: 'Notification Channel',
          channelDescription: 'This channel is used for reminder notifications',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.black,
          playSound: true,
          soundSource: 'resource://raw/bell_notification',
          enableVibration: true,
          enableLights: true,
        ),
        
        NotificationChannel(
          channelKey:
              'my_foreground_channel', // Foreground service notification channel
          channelName: 'Foreground Service Channel',
          channelDescription:
              'This channel is used for foreground service notifications',
          importance: NotificationImportance
              .High, // Set the importance level for foreground services
          playSound:
              false, // Foreground service notifications often don't have sound
          enableVibration: false, // You can adjust these settings as needed
        ),
      ],
    
      
      
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group',
        )
      ],
      debug: true,
    );
      await AwesomeNotifications().setListeners(
        onActionReceivedMethod: (receivedAction) async {
      if (receivedAction.buttonKeyPressed == 'SNOOZE') {
        print('Snooze button pressed!');
        await AwesomeNotifications().cancel(id);
        print("SuccessFully Canceled");
        // Call your custom snooze function here
      } else if (receivedAction.buttonKeyPressed == 'TAKE') {
        print('Take button pressed!');
      }
      return Future.value();
    });
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
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
        notificationChannelId:
            'my_foreground_channel', // Foreground service channel
        initialNotificationTitle: 'Meditrace Service Active',
        initialNotificationContent: 'Checking Medicines ',
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
