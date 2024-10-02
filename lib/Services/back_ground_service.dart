import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meditrace_project/Services/notification_service.dart'; // Required for Android specific service

class BackGroundService {
 

   static Future<bool> onStart(ServiceInstance service) async {
    Timer.periodic(const Duration(minutes: 1), (timer) async {
      print("Background service running at ${DateTime.now()}");

      // Check if it's time for any medicine
     NotificationService.checkMedicineTimes();
    });
    return true;
  }
// Initialize the background service
  static Future<void> initializeService() async {
    final service = FlutterBackgroundService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        autoStart: true,
        isForegroundMode: true,
        notificationChannelId: 'my_foreground',
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
