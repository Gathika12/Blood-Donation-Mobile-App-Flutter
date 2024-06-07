import 'package:flutter/material.dart';
import 'package:practice02/contactus.dart';
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
                      'assets/profile.jpg'), // Replace with your image path
                ),
                SizedBox(height: 10), // Space between image and text
                Text(
                  'Blood Doner',
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
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          SizedBox(height: 350),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red, fixedSize: Size(300.0, 50.0)),
              child: Text(
                "Log out",
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
