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
    apiKey: 'AIzaSyB2ZBhgvMrdbwkBzgVJXcNcTA2tblbBDmg',
    appId: '1:105719436597:web:4c9f93464a76042bfea87c',
    messagingSenderId: '105719436597',
    projectId: 'todo-new-44b92',
    authDomain: 'todo-new-44b92.firebaseapp.com',
    storageBucket: 'todo-new-44b92.appspot.com',
    measurementId: 'G-J6WEX02S9H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBK5w21583CWTJ5fE6JU4nCnB7X-wHL-4Q',
    appId: '1:105719436597:android:e9dbc93a07b17938fea87c',
    messagingSenderId: '105719436597',
    projectId: 'todo-new-44b92',
    storageBucket: 'todo-new-44b92.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCEbH8KBW3aJ8jZpOK5uHWCvunnMGhDyc8',
    appId: '1:105719436597:ios:8516d5697429dfd0fea87c',
    messagingSenderId: '105719436597',
    projectId: 'todo-new-44b92',
    storageBucket: 'todo-new-44b92.appspot.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCEbH8KBW3aJ8jZpOK5uHWCvunnMGhDyc8',
    appId: '1:105719436597:ios:bacfb658b04a3dd1fea87c',
    messagingSenderId: '105719436597',
    projectId: 'todo-new-44b92',
    storageBucket: 'todo-new-44b92.appspot.com',
    iosBundleId: 'com.example.todo.RunnerTests',
  );
}
