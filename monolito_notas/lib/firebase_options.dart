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
    apiKey: 'AIzaSyASfm_14X4v97H2yWKrRy6xf7nk3TCPjrc',
    appId: '1:339349470481:web:ccda9045b829ee7f0f20b0',
    messagingSenderId: '339349470481',
    projectId: 'blocnotas-6f5d4',
    authDomain: 'blocnotas-6f5d4.firebaseapp.com',
    storageBucket: 'blocnotas-6f5d4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCzqEgsYJvGc7udPnBkeS613cV85SycIRg',
    appId: '1:339349470481:android:6355dac2e3f6b90a0f20b0',
    messagingSenderId: '339349470481',
    projectId: 'blocnotas-6f5d4',
    storageBucket: 'blocnotas-6f5d4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDmLU0hV3qCINPCv0bJbRbHppWJ1X11nPQ',
    appId: '1:339349470481:ios:d7832ca48de380640f20b0',
    messagingSenderId: '339349470481',
    projectId: 'blocnotas-6f5d4',
    storageBucket: 'blocnotas-6f5d4.appspot.com',
    iosBundleId: 'com.example.monolitoNotas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDmLU0hV3qCINPCv0bJbRbHppWJ1X11nPQ',
    appId: '1:339349470481:ios:6e1aad0bcbdbdf760f20b0',
    messagingSenderId: '339349470481',
    projectId: 'blocnotas-6f5d4',
    storageBucket: 'blocnotas-6f5d4.appspot.com',
    iosBundleId: 'com.example.monolitoNotas.RunnerTests',
  );
}
