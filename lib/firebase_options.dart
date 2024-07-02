// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyB4HUek9xp181SnL0C6Ik3riQh3TVQf0Q8',
    appId: '1:25065872577:web:a9a9409b78d1b1b4268840',
    messagingSenderId: '25065872577',
    projectId: 'nomad-coder-thread',
    authDomain: 'nomad-coder-thread.firebaseapp.com',
    storageBucket: 'nomad-coder-thread.appspot.com',
    measurementId: 'G-8Y1H5CKTVY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMcKy2wv8tZxAKrW0MV50ZkIoU9QA4lCs',
    appId: '1:25065872577:android:69e7afc39f8638d3268840',
    messagingSenderId: '25065872577',
    projectId: 'nomad-coder-thread',
    storageBucket: 'nomad-coder-thread.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5KpGtbMPaUb7q3eQkaEyggPdf9RPVCtc',
    appId: '1:25065872577:ios:c671766fa8f1a8f9268840',
    messagingSenderId: '25065872577',
    projectId: 'nomad-coder-thread',
    storageBucket: 'nomad-coder-thread.appspot.com',
    iosBundleId: 'com.example.treadCloneAssignment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB4HUek9xp181SnL0C6Ik3riQh3TVQf0Q8',
    appId: '1:25065872577:web:0d465ff56119ab9d268840',
    messagingSenderId: '25065872577',
    projectId: 'nomad-coder-thread',
    authDomain: 'nomad-coder-thread.firebaseapp.com',
    storageBucket: 'nomad-coder-thread.appspot.com',
    measurementId: 'G-KB4WLLDMRY',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD5KpGtbMPaUb7q3eQkaEyggPdf9RPVCtc',
    appId: '1:25065872577:ios:c671766fa8f1a8f9268840',
    messagingSenderId: '25065872577',
    projectId: 'nomad-coder-thread',
    storageBucket: 'nomad-coder-thread.appspot.com',
    iosBundleId: 'com.example.treadCloneAssignment',
  );

}