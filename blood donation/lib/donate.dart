import 'package:flutter/material.dart';
import 'package:practice02/home.dart';
import 'package:practice02/login.dart';

void main() {
  runApp(MaterialApp(
    home: DonatePage(),
  ));
}

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _LocationController = TextEditingController();
  TextEditingController _DateController = TextEditingController();
  TextEditingController _TimeController = TextEditingController();
  TextEditingController _AllergiesController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  String? _selectedBloodGroup;
  List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  String? _selectedPriorDonation;
  List<String> _priorDonations = ['Yes', 'No'];

  Widget _buildOvalTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    required BuildContext context,
    bool isDateField = false,
    bool isTimeField = false,
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
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: labelText,
                prefixIcon: Icon(
                  icon,
                  color: Colors.blueAccent,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: 20.0, right: 10.0, top: 16.0, bottom: 16.0),
              ),
              validator: validator,
            ),
          ),
          if (isDateField)
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  final String formattedDate =
                      "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                  setState(() {
                    controller.text = formattedDate;
                  });
                }
              },
            ),
          if (isTimeField)
            IconButton(
              icon: Icon(Icons.access_time),
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  final String formattedTime =
                      "${pickedTime.hour}:${pickedTime.minute}";
                  setState(() {
                    controller.text = formattedTime;
                  });
                }
              },
            ),
        ],
      ),
    );
  }

  void signUp() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Form is valid')));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashboardPage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Form is not valid')));
    }
  }

  Widget _buildDropdownField({
    required String labelText,
    required IconData icon,
    required List<String> items,
    required String? selectedItem,
    required void Function(String?) onChanged,
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
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: selectedItem,
              decoration: InputDecoration(
                labelText: labelText,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: onChanged,
              validator: (value) =>
                  value == null ? 'Please select an option' : null,
            ),
          ),
        ],
      ),
    );
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildOvalTextFieldWithIcon(
                  controller: _fullNameController,
                  labelText: 'Full Name',
                  icon: Icons.person,
                  context: context,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                _buildOvalTextFieldWithIcon(
                  controller: _LocationController,
                  labelText: 'Location',
                  icon: Icons.location_city,
                  context: context,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  },
                ),
                _buildDropdownField(
                  labelText: 'Blood Group',
                  icon: Icons.bloodtype,
                  items: _bloodGroups,
                  selectedItem: _selectedBloodGroup,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedBloodGroup = newValue;
                    });
                  },
                ),
                _buildOvalTextFieldWithIcon(
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                  context: context,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                _buildOvalTextFieldWithIcon(
                  controller: _DateController,
                  labelText: 'Date',
                  icon: Icons.date_range,
                  context: context,
                  isDateField: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                ),
                _buildOvalTextFieldWithIcon(
                  controller: _TimeController,
                  labelText: 'Time',
                  icon: Icons.time_to_leave,
                  context: context,
                  isTimeField: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a time';
                    }
                    return null;
                  },
                ),
                _buildDropdownField(
                  labelText: 'Prior Donation',
                  icon: Icons.card_giftcard,
                  items: _priorDonations,
                  selectedItem: _selectedPriorDonation,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedPriorDonation = newValue;
                    });
                  },
                ),
                _buildOvalTextFieldWithIcon(
                  controller: _AllergiesController,
                  labelText: 'Allergies/Diseases',
                  icon: Icons.lock,
                  context: context,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter any allergies or diseases';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: signUp,
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
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _LocationController.dispose();
    _DateController.dispose();
    _TimeController.dispose();
    _AllergiesController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
