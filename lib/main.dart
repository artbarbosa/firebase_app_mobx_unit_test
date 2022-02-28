import 'package:firebase_app_mobx/app/core/services/remote/firebase_remote_config_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/app_widget.dart';
import 'app/core/services/remote/firebase_messaging_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDh2bqcnJFk3dU5dBg3BydMRTSz2u3J2TQ',
    appId: '1:547571169078:web:30327e3b1ad00f9901a597',
    messagingSenderId: '547571169078',
    projectId: 'fir-app-test-bda35',
  ));
  await FirebaseMessagingService().inicialize();
  await FirebaseRemoteConfigService().initialize();

  runApp(const AppWidget());
}
