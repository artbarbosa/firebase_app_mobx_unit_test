import 'dart:async';

import 'package:firebase_app_mobx/app/core/services/remote/firebase_remote_config_service.dart';
import 'package:firebase_app_mobx/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'app/app_widget.dart';
import 'app/core/services/local/flutter_local_notification_service.dart';
import 'app/core/services/remote/firebase_messaging_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessagingService(
          flutterLocalNotification: FlutterLocalNotificationService(),
          messaging: FirebaseMessaging.instance)
      .inicialize();
  await FirebaseRemoteConfigService().initialize();

  runZonedGuarded(() {
    runApp(
      const AppWidget(),
    );
  }, FirebaseCrashlytics.instance.recordError);
}
