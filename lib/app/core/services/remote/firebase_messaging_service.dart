import 'package:firebase_app_mobx/app/core/services/local/flutter_local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class FirebaseMessagingService {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationService flutterLocalNotification =
      FlutterLocalNotificationService();

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
     // navigatorKey.currentState?.pushNamed(message.data['goTO']);
    });
  }

  getTokenFirebase() async =>
      debugPrint(await FirebaseMessaging.instance.getToken());
}
