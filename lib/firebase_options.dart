// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDh2bqcnJFk3dU5dBg3BydMRTSz2u3J2TQ',
    appId: '1:547571169078:web:30327e3b1ad00f9901a597',
    messagingSenderId: '547571169078',
    projectId: 'fir-app-test-bda35',
    authDomain: 'fir-app-test-bda35.firebaseapp.com',
    storageBucket: 'fir-app-test-bda35.appspot.com',
    measurementId: 'G-S352XFGWG4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCzBpi-BHN35OVqvyDJ30hL0wPqh5w0r0',
    appId: '1:547571169078:android:5125158f24e3b6cd01a597',
    messagingSenderId: '547571169078',
    projectId: 'fir-app-test-bda35',
    storageBucket: 'fir-app-test-bda35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIqyleXJp2Ie_h9J3GRKvLIO3D9TGhHcA',
    appId: '1:547571169078:ios:26e4a62f9b172c5a01a597',
    messagingSenderId: '547571169078',
    projectId: 'fir-app-test-bda35',
    storageBucket: 'fir-app-test-bda35.appspot.com',
    iosClientId: '547571169078-bjv9srpdh8mcjhq8df43ie80smbircsp.apps.googleusercontent.com',
    iosBundleId: 'com.exemple.com',
  );
}
