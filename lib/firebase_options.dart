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
    apiKey: 'AIzaSyA456EUb1S2I7cWcdPknq15lFodJV3sEUo',
    appId: '1:636373694214:web:601a55895eaab84ccb5087',
    messagingSenderId: '636373694214',
    projectId: 'createaccount-e81a7',
    authDomain: 'createaccount-e81a7.firebaseapp.com',
    databaseURL: 'https://createaccount-e81a7-default-rtdb.firebaseio.com',
    storageBucket: 'createaccount-e81a7.appspot.com',
    measurementId: 'G-3ZVCDD4MQ2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBV2kA-0ayujXt_nxRKjlSLl93-7yxprNI',
    appId: '1:636373694214:android:b30e8e6af17760c0cb5087',
    messagingSenderId: '636373694214',
    projectId: 'createaccount-e81a7',
    databaseURL: 'https://createaccount-e81a7-default-rtdb.firebaseio.com',
    storageBucket: 'createaccount-e81a7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDp6KlBamsE6_1xlCGgArscJDkBjNbmZ_A',
    appId: '1:636373694214:ios:e3c3e33b9a790bc3cb5087',
    messagingSenderId: '636373694214',
    projectId: 'createaccount-e81a7',
    databaseURL: 'https://createaccount-e81a7-default-rtdb.firebaseio.com',
    storageBucket: 'createaccount-e81a7.appspot.com',
    iosBundleId: 'com.example.lib',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDp6KlBamsE6_1xlCGgArscJDkBjNbmZ_A',
    appId: '1:636373694214:ios:12f071256781f409cb5087',
    messagingSenderId: '636373694214',
    projectId: 'createaccount-e81a7',
    databaseURL: 'https://createaccount-e81a7-default-rtdb.firebaseio.com',
    storageBucket: 'createaccount-e81a7.appspot.com',
    iosBundleId: 'com.example.lib.RunnerTests',
  );
}