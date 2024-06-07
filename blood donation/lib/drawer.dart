import 'package:flutter/material.dart';
import 'package:practice02/welcome.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 40, // Adjust radius as needed
                  backgroundImage: AssetImage(
                      'assets/image1.jpg'), // Replace with your image path
                ),
                SizedBox(height: 10), // Space between image and text
                Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red, fixedSize: Size(300.0, 50.0)),
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Drawer Example')),
      body: Center(child: Text('My Page!')),
      drawer: MyDrawer(),
    ),
  ));
}
