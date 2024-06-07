import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice02/donate.dart';
import 'package:practice02/instruction.dart';
import 'package:practice02/login.dart';
import 'package:practice02/drawer.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Text(
            "Give the Gift of Life",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BloodDonationGuidelines()));
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Ink.image(
                            image: AssetImage('assets/donate.jpeg'),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                            child: Container(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BloodDonationGuidelines()));
                          },
                          child: Text('Guide'),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DonatePage()));
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Ink.image(
                            image: AssetImage('assets/guide.jpeg'),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                            child: Container(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DonatePage()));
                          },
                          child: Text('Donate'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                backgroundColor: Colors.red,
                child: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
      endDrawer: MyDrawer(),
    );
  }
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Make status bar transparent
  ));
  runApp(MaterialApp(
    home: DashboardPage(),
  ));
}
