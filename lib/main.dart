import 'package:firebase_app_mobx/app/core/services/remote/firebase_remote_config_service.dart';
import 'package:firebase_app_mobx/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/app_widget.dart';
import 'app/core/services/remote/firebase_messaging_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessagingService().inicialize();
  await FirebaseRemoteConfigService().initialize();

  runApp(const AppWidget());
}
