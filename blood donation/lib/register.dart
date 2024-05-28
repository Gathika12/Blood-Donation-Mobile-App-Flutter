import 'package:flutter/material.dart';
import 'package:practice02/login.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterPage(),
  ));
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactNoController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _retypePasswordController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  String? _selectedGender;
  String? _selectedBloodGroup;

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

  Widget _buildBloodGroupDropdown() {
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
      child: DropdownButtonFormField<String>(
        value: _selectedBloodGroup,
        decoration: InputDecoration(
          labelText: 'Select Blood Group',
          prefixIcon: Icon(Icons.bloodtype),
          border: InputBorder.none,
        ),
        onChanged: (newValue) {
          setState(() {
            _selectedBloodGroup = newValue;
          });
        },
        items: ['Select Blood Group','A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.blueAccent),
            ),
          );
        }).toList(),
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
      child: DropdownButtonFormField<String>(
        value: _selectedGender,
        decoration: InputDecoration(
          labelText: 'Gender',
          prefixIcon: Icon(Icons.people),
          border: InputBorder.none,
        ),
        onChanged: (newValue) {
          setState(() {
            _selectedGender = newValue;
          });
        },
        items: ['Select Gender','Male', 'Female', 'Other']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.blueAccent),
            ),
          );
        }).toList(),
      ),
    );
  }

  void signUp() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Create Account clicked')));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Your Account',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red, 
        elevation: 0.0,
      ),
      backgroundColor: Colors.white, 
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min, 
          children: [
            _buildOvalTextFieldWithIcon(
              controller: _firstNameController,
              labelText: 'First Name',
              icon: Icons.person,
            ),
            _buildOvalTextFieldWithIcon(
              controller: _lastNameController,
              labelText: 'Last Name',
              icon: Icons.person,
            ),
            _buildGenderDropdown(), 
            _buildBloodGroupDropdown(),
            _buildOvalTextFieldWithIcon(
              controller: _emailController,
              labelText: 'Email',
              icon: Icons.email,
            ),
            _buildOvalTextFieldWithIcon(
              controller: _contactNoController,
              labelText: 'Contact No',
              icon: Icons.phone,
            ),
            _buildOvalTextFieldWithIcon(
              controller: _usernameController,
              labelText: 'Username',
              icon: Icons.account_circle,
            ),
            _buildOvalTextFieldWithIcon(
              controller: _passwordController,
              labelText: 'Password',
              icon: Icons.lock,
            ),
            _buildOvalTextFieldWithIcon(
              controller: _retypePasswordController,
              labelText: 'Retype Password',
              icon: Icons.lock,
            ),

            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text('Create Account',
                  style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )
              )
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _contactNoController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }
}
