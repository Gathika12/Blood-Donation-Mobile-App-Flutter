import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Set the preferred height for the AppBar
        child: AppBar(
          backgroundColor: Colors.red, // Set the background color to red
          automaticallyImplyLeading: false, // Hide the automatically generated back button
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen (LoginPage.dart)
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20), // Add space at the top of the screen
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle donate button press
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
                        // Handle guide button press
                      },
                      child: Text('Guide'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle donate button press
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
                        // Handle donate button press
                      },
                      child: Text('Donate'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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