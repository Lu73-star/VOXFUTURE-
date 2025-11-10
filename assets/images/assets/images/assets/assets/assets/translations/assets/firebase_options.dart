// ignore_for_file: constant_identifier_names

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
      default:
        throw UnsupportedError('Plataforma não suportada.');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "SUA_API_KEY",
    authDomain: "SEU_PROJETO.firebaseapp.com",
    projectId: "SEU_PROJETO",
    storageBucket: "SEU_PROJETO.appspot.com",
    messagingSenderId: "SEU_SENDER_ID",
    appId: "SUA_APP_ID",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "SUA_API_KEY_ANDROID",
    appId: "SUA_APP_ID_ANDROID",
    messagingSenderId: "SEU_SENDER_ID",
    projectId: "SEU_PROJETO",
    storageBucket: "SEU_PROJETO.appspot.com",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "SUA_API_KEY_IOS",
    appId: "SUA_APP_ID_IOS",
    messagingSenderId: "SEU_SENDER_ID",
    projectId: "SEU_PROJETO",
    storageBucket: "SEU_PROJETO.appspot.com",
    iosClientId: "SEU_IOS_CLIENT_ID",
    iosBundleId: "SEU_IOS_BUNDLE_ID",
  );
}
