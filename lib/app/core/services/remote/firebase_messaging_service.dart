import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../../app_widget.dart';
import '../local/flutter_local_notification_service.dart';

class FirebaseMessagingService {
  final FirebaseMessaging messaging;
  final FlutterLocalNotificationService flutterLocalNotification;

  FirebaseMessagingService({
    required this.messaging,
    required this.flutterLocalNotification,
  });

  Future<void> inicialize({VoidCallback? callback}) async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(badge: true, sound: true);
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (message.data['forceFatchRC'] != null) return callback?.call();
      if (notification != null && android != null) {
        flutterLocalNotification.androidNotification(notification, android);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.data['goTO'] != null) {
        navigatorKey.currentState?.pushNamed(message.data['goTO']);
      }
      if (message.data['forceFatchRC'] != null) callback?.call();
    });
  }

  getTokenFirebase() async =>
      debugPrint(await FirebaseMessaging.instance.getToken());
}
