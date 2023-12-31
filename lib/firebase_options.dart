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
    apiKey: 'AIzaSyBMs9G0J_G0nIXehaZ32tFEKEu3-wBCKC8',
    appId: '1:219620858963:web:00dc3620f2826b811f3aa6',
    messagingSenderId: '219620858963',
    projectId: 'auth-26c90',
    authDomain: 'auth-26c90.firebaseapp.com',
    storageBucket: 'auth-26c90.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB49R9CTAWPqsEqPy1yRhzDk0PUkCG4e-A',
    appId: '1:219620858963:android:27072e1ca53d05b21f3aa6',
    messagingSenderId: '219620858963',
    projectId: 'auth-26c90',
    storageBucket: 'auth-26c90.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZnmAeQTIR-QoUO0yKJodX1Qy3WLI0fws',
    appId: '1:219620858963:ios:3be271722a4d4cc41f3aa6',
    messagingSenderId: '219620858963',
    projectId: 'auth-26c90',
    storageBucket: 'auth-26c90.appspot.com',
    iosClientId:
        '219620858963-h25qqmshimma4316f178n7ftnjv2mrc5.apps.googleusercontent.com',
    iosBundleId: 'com.example.modernlogintute',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZnmAeQTIR-QoUO0yKJodX1Qy3WLI0fws',
    appId: '1:219620858963:ios:3be271722a4d4cc41f3aa6',
    messagingSenderId: '219620858963',
    projectId: 'auth-26c90',
    storageBucket: 'auth-26c90.appspot.com',
    iosClientId:
        '219620858963-h25qqmshimma4316f178n7ftnjv2mrc5.apps.googleusercontent.com',
    iosBundleId: 'com.example.modernlogintute',
  );
}
