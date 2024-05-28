import 'package:flutter/material.dart';
import 'package:practice02/login.dart';

void main() {
  runApp(MaterialApp(
    home: DonatePage(),
  ));
}

class DonatePage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<DonatePage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _LocationController = TextEditingController();
  TextEditingController _DateController = TextEditingController();
  TextEditingController _TimeController = TextEditingController();
  TextEditingController _PriordonationController = TextEditingController();
  TextEditingController _AllergiesController = TextEditingController();

  String? _selectedGender;

  Widget _buildOvalTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        border: Border.all(color: Colors.red),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(
            icon,
            color: Colors.blueAccent,
          ),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.red),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }

  void signUp() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Create Account clicked')));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Donation Form',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildOvalTextFieldWithIcon(
                controller: _fullNameController,
                labelText: 'Full Name',
                icon: Icons.person,
              ),
              _buildOvalTextFieldWithIcon(
                controller: _LocationController,
                labelText: 'Location',
                icon: Icons.location_city,
              ),
              _buildOvalTextFieldWithIcon(
                controller: _DateController,
                labelText: 'Date',
                icon: Icons.date_range,
              ),
              _buildOvalTextFieldWithIcon(
                controller: _TimeController,
                labelText: 'Time',
                icon: Icons.time_to_leave,
              ),
              _buildOvalTextFieldWithIcon(
                controller: _PriordonationController,
                labelText: 'prior donation',
                icon: Icons.card_giftcard,
              ),
              _buildOvalTextFieldWithIcon(
                controller: _AllergiesController,
                labelText: 'Allergies/diseases',
                icon: Icons.lock,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text('Request Donation',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _LocationController.dispose();
    _DateController.dispose();
    _TimeController.dispose();
    _PriordonationController.dispose();
    _AllergiesController.dispose();
    super.dispose();
  }
}
