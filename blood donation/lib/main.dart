import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practice02/home.dart';
//import 'package:practice02/home.dart';
//import 'package:practice02/register.dart';
//import 'package:practice02/welcome.dart';
//import 'login.dart';
//import 'welcome.dart';
//import 'register.dart'; // Import login.dart where HomePage widget is defined

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDUES_gU8F2TJMWKsyK2fdT6PyRTfrYZoQ",
            authDomain: "practice-app-42316.firebaseapp.com",
            projectId: "practice-app-42316",
            storageBucket: "practice-app-42316.appspot.com",
            messagingSenderId: "640261579967",
            appId: "1:640261579967:web:a17a76f4cd82d006ba920a"));
  } else {
    await Firebase.initializeApp();
  }
*/
  runApp(MaterialApp(
    home: DashboardPage(), // Use HomePage widget as the home page
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
