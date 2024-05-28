import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: BloodDonationGuidelines(),
  ));
}

class BloodDonationGuidelines extends StatelessWidget {
  Widget _buildInstructionPoint(String instruction) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
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
      child: Text(
        instruction,
        style: TextStyle(fontSize: 16.0, color: Colors.black),
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
            'Blood Donation Guidelines',
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
              _buildInstructionPoint('1. Ensure you meet the eligibility criteria for blood donation.'),
              _buildInstructionPoint('2. Eat a healthy meal and drink plenty of water before donation.'),
              _buildInstructionPoint('3. Bring a valid ID to the donation center.'),
              _buildInstructionPoint('4. Wear comfortable clothing with sleeves that can be easily rolled up.'),
              _buildInstructionPoint('5. Inform the staff if you have any medical conditions or are taking any medications.'),
              _buildInstructionPoint('6. Follow the instructions given by the medical staff during the donation process.'),
              _buildInstructionPoint('7. After donation, rest for a few minutes and have a snack if provided.'),
              _buildInstructionPoint('8. Avoid strenuous activities for the rest of the day.'),
              _buildInstructionPoint('9. Drink plenty of fluids and eat healthy meals for the next 24 hours.'),
              _buildInstructionPoint('10. If you feel unwell at any time after donation, contact the donation center immediately.'),
            ],
          ),
        ),
      ),
    );
  }
}
