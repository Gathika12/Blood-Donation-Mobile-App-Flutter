import 'package:flutter/material.dart';
import 'package:practice02/login.dart';
import 'package:practice02/register.dart';

class Welcome extends StatefulWidget {
  @override
  WelcomePage createState() => WelcomePage();
}

class WelcomePage extends State<Welcome> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Image above the form
              Image(
                image: AssetImage(
                    'assets/6.jpg'), // Replace 'assets/image.jpg' with the path to your local image
                height: 520,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              fixedSize: Size(300.0, 50.0)),
                          child: Text(
                            "Log In",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 26),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              fixedSize: Size(300.0, 50.0)),
                          child: Text(
                            "Register",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed logic here
        },
        tooltip: 'Press',
        child: Icon(Icons.help),
      ),
    );
  }
}
