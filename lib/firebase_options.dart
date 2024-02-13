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
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC0dtNZJ2jrDilC7zADJAoBxzvu6Lghdmw',
    appId: '1:28636562965:web:ba6ddf4f89b01617f3701c',
    messagingSenderId: '28636562965',
    projectId: 'attendence-41c6e',
    authDomain: 'attendence-41c6e.firebaseapp.com',
    storageBucket: 'attendence-41c6e.appspot.com',
    measurementId: 'G-QQ5NCMG2W1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCahtnnz6PjHqQHWYgkgTYl0TAX0TTntCY',
    appId: '1:28636562965:android:edb17fa43740c128f3701c',
    messagingSenderId: '28636562965',
    projectId: 'attendence-41c6e',
    storageBucket: 'attendence-41c6e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXdsdFPjh4lS1fuWLMxKgZqsbBKMQCwJg',
    appId: '1:28636562965:ios:4bcc70721b16c5dff3701c',
    messagingSenderId: '28636562965',
    projectId: 'attendence-41c6e',
    storageBucket: 'attendence-41c6e.appspot.com',
    iosBundleId: 'com.example.passmaTime',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCXdsdFPjh4lS1fuWLMxKgZqsbBKMQCwJg',
    appId: '1:28636562965:ios:0c4864ab18ccbc14f3701c',
    messagingSenderId: '28636562965',
    projectId: 'attendence-41c6e',
    storageBucket: 'attendence-41c6e.appspot.com',
    iosBundleId: 'com.example.passmaTime.RunnerTests',
  );
}
