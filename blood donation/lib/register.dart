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

  TextEditingController _BoolGroopController = TextEditingController();

  String? _selectedGender;

  Widget _buildOvalTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0), // Make it oval-shaped
        color: Colors.white,
        border: Border.all(color: Colors.red), // Red border
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
        borderRadius: BorderRadius.circular(30.0), // Make it oval-shaped
        border: Border.all(color: Colors.red), // Red border
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
          hintText: 'Gender',
          border: InputBorder.none,
        ),
        onChanged: (newValue) {
          setState(() {
            _selectedGender = newValue;
          });
        },
        items: ['Male', 'Female', 'Other']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
      ),
    );
  }

  void signUp() {
    // Placeholder for the signup functionality
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
        backgroundColor: Colors.red, // Red background color
        elevation: 0.0,
      ),
      backgroundColor: Colors.white, // White background color
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            _buildOvalTextFieldWithIcon(
              controller: _BoolGroopController,
              labelText: 'Bool Groop',
              icon: Icons.favorite, // Blood icon
            ),
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
            _buildGenderDropdown(),
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

            // Updated TextField with blood icon

            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }, // Call the signUp method here
              child: Text('Create Account',
                  style: TextStyle(color: Colors.white)), // White text color
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red button color
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
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
    _BoolGroopController.dispose();
    super.dispose();
  }
}
