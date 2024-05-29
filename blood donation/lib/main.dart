import 'package:flutter/material.dart';
import 'package:practice02/home.dart';
import 'package:practice02/donate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:practice02/home.dart';
import 'package:practice02/login.dart';
import 'package:practice02/register.dart';
import 'package:practice02/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDK4FxslOXgh0KnlqSdbbyVWyIdddKljts",
            authDomain: "blood-donation-92d7a.firebaseapp.com",
            projectId: "blood-donation-92d7a",
            storageBucket: "blood-donation-92d7a.appspot.com",
            messagingSenderId: "1012394506879",
            appId: "1:1012394506879:android:79e7947219187b2ba45d4a"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MaterialApp(
    home: Welcome(),
  ));
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("My App"),
      backgroundColor: Colors.black,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
