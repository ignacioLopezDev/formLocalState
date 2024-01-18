import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCk7iJNHWskliTTnb-fkXsTKwYTxcVwc_w",
            authDomain: "from-localstate.firebaseapp.com",
            projectId: "from-localstate",
            storageBucket: "from-localstate.appspot.com",
            messagingSenderId: "847122619091",
            appId: "1:847122619091:web:2d1617b151926bfbab9226"));
  } else {
    await Firebase.initializeApp();
  }
}
