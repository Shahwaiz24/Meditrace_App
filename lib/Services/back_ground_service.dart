import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart'; // Required for Android specific service

class BackGroundService {
  static Future<bool> onStart(ServiceInstance service) async {
    Timer.periodic(const Duration(seconds: 3), (timer) async {
      // Perform your periodic task here
      print("Background service running at ${DateTime.now()}");
    });
    return true; // Return true to indicate successful start
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
