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
    apiKey: 'AIzaSyAVKZtHdaQq30pXqhAJein3mJna5xQ3oy4',
    appId: '1:870229156697:web:593dab2c1b42fc81132248',
    messagingSenderId: '870229156697',
    projectId: 'tinker-9b347',
    authDomain: 'tinker-9b347.firebaseapp.com',
    storageBucket: 'tinker-9b347.appspot.com',
    measurementId: 'G-8799YJXMJM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAUQthAXAER_NPY7zwYC5vdWyg_IdXulqI',
    appId: '1:870229156697:android:274efcf7b7452d16132248',
    messagingSenderId: '870229156697',
    projectId: 'tinker-9b347',
    storageBucket: 'tinker-9b347.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCERP3vqxWaO2J5DafxmRn6TEeDXnFox-k',
    appId: '1:870229156697:ios:b2a62c0ff1ee1aaa132248',
    messagingSenderId: '870229156697',
    projectId: 'tinker-9b347',
    storageBucket: 'tinker-9b347.appspot.com',
    iosClientId: '870229156697-ehpmr361nkgmm597m6s0ffaac0ibp0vq.apps.googleusercontent.com',
    iosBundleId: 'io.justd.tinkercad',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCERP3vqxWaO2J5DafxmRn6TEeDXnFox-k',
    appId: '1:870229156697:ios:b2a62c0ff1ee1aaa132248',
    messagingSenderId: '870229156697',
    projectId: 'tinker-9b347',
    storageBucket: 'tinker-9b347.appspot.com',
    iosClientId: '870229156697-ehpmr361nkgmm597m6s0ffaac0ibp0vq.apps.googleusercontent.com',
    iosBundleId: 'io.justd.tinkercad',
  );
}
