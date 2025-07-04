// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyBZr4iM8m2J66zP6dUUtiaAW00olSnoNDw',
    appId: '1:728710639837:web:ef195ff9152470a23beb34',
    messagingSenderId: '728710639837',
    projectId: 'mednova-7bff7',
    authDomain: 'mednova-7bff7.firebaseapp.com',
    storageBucket: 'mednova-7bff7.firebasestorage.app',
    measurementId: 'G-XXXXXXXXXX', // Optional, you can remove this if you don’t use analytics
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB73TkcwHviFSsSLQtiB-4SN7zDa1euUOw',
    appId: '1:728710639837:android:113dde8dd0331f693beb34',
    messagingSenderId: '728710639837',
    projectId: 'mednova-7bff7',
    storageBucket: 'mednova-7bff7.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWqRICDbweajL0U_4QEQUwlohaZ5-VWeY',
    appId: '1:728710639837:ios:e5bb34361201c4143beb34',
    messagingSenderId: '728710639837',
    projectId: 'mednova-7bff7',
    storageBucket: 'mednova-7bff7.firebasestorage.app',
    iosBundleId: 'com.example.mednova',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWqRICDbweajL0U_4QEQUwlohaZ5-VWeY',
    appId: '1:728710639837:ios:e5bb34361201c4143beb34',
    messagingSenderId: '728710639837',
    projectId: 'mednova-7bff7',
    storageBucket: 'mednova-7bff7.firebasestorage.app',
    iosBundleId: 'com.example.mednova',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBZr4iM8m2J66zP6dUUtiaAW00olSnoNDw',
    appId: '1:728710639837:web:0658052cb6f2a6063beb34',
    messagingSenderId: '728710639837',
    projectId: 'mednova-7bff7',
    authDomain: 'mednova-7bff7.firebaseapp.com',
    storageBucket: 'mednova-7bff7.firebasestorage.app',
  );
}
