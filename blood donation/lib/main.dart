import 'package:flutter/material.dart';
import 'package:practice02/donate.dart';
import 'package:practice02/register.dart';

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
    home: DonatePage(),
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
