import 'package:flutter/material.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactNoController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _retypePasswordController = TextEditingController();


  String? _selectedGender;
  String? _selectedBloodGroup;

  Widget _buildOvalTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    String? Function(String?)? validator,
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
        obscureText: obscureText,
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
        validator: validator,
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
        items: ['Select Blood Group', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.blueAccent),
            ),
          );
        }).toList(),
        validator: (value) {
          if (value == null || value == 'Select Blood Group') {
            return 'Please select a blood group';
          }
          return null;
        },
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
        items: ['Select Gender', 'Male', 'Female', 'Other']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.blueAccent),
            ),
          );
        }).toList(),
        validator: (value) {
          if (value == null || value == 'Select Gender') {
            return 'Please select a gender';
          }
          return null;
        },
      ),
    );
  }

  void signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      // Process the form data
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Create Account clicked')));
    }
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildOvalTextFieldWithIcon(
                  controller: _firstNameController,
                  labelText: 'First Name',
                  icon: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                _buildOvalTextFieldWithIcon(
                  controller: _lastNameController,
                  labelText: 'Last Name',
                  icon: Icons.person,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                _buildGenderDropdown(),
                _buildBloodGroupDropdown(),
                _buildOvalTextFieldWithIcon(
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                _buildOvalTextFieldWithIcon(
                  controller: _contactNoController,
                  labelText: 'Contact No',
                  icon: Icons.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact number';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid 10-digit contact number';
                    }
                    return null;
                  },
                ),
                _buildOvalTextFieldWithIcon(
                  controller: _usernameController,
                  labelText: 'Username',
                  icon: Icons.account_circle,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                _buildOvalTextFieldWithIcon(
                  controller: _passwordController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                _buildOvalTextFieldWithIcon(
                  controller: _retypePasswordController,
                  labelText: 'Retype Password',
                  icon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please retype your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: signUp,
                  child: Text('Create Account',
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
