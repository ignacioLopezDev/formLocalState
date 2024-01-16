import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBixTSPP252fsa6lZrVHUOXO1XqRWZgmbI",
            authDomain: "form-local-state-1xl3ri.firebaseapp.com",
            projectId: "form-local-state-1xl3ri",
            storageBucket: "form-local-state-1xl3ri.appspot.com",
            messagingSenderId: "839934520126",
            appId: "1:839934520126:web:eb9d746228c543b317da6f"));
  } else {
    await Firebase.initializeApp();
  }
}
