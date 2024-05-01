import 'dart:async';

import 'package:flutter/material.dart';
import 'package:venue/components/custom_button.dart';
import 'package:venue/components/snack_bar.dart';

class OtpPopup extends StatefulWidget {
  @override
  _OtpPopupState createState() => _OtpPopupState();
}

class _OtpPopupState extends State<OtpPopup> {
  TextEditingController _otpController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  late Timer _timer;
  int _secondsRemaining = 300; // 5 minutes
  String? _emailValidationError;

  String? _validateOTP(String value) {
    final RegExp otpRegex = RegExp(r'^\d{6}$'); // Regex for exactly 6 digits
    if (!otpRegex.hasMatch(value)) {
      showError(context, 'Enter OTP');
      // Show error message if the entered value does not match the OTP pattern
      setState(() {
        _emailValidationError = 'Enter a valid 6-digit OTP';
      });
      return 'Enter a valid 6-digit OTP';
    } else {
      // Clear any previous validation error
      setState(() {
        _emailValidationError = null;
      });
      return null; // No error
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel();
          Navigator.pop(context); // Close the dialog when timer expires
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Enter OTP'),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.cancel,
              color: Colors.black,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _emailValidationError != null
                    ? Colors.red
                    : Colors.grey.withOpacity(0.4),
              ),
            ),
            child: Center(
              child: TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter OTP",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  // Call the validation method when the text changes
                  _validateOTP(value);
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Time remaining: ${_secondsRemaining ~/ 60}:${(_secondsRemaining % 60).toString().padLeft(2, '0')}',
          ),
          SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              String enteredOTP = _otpController.text;
              String? otpError = _validateOTP(enteredOTP);
              if (otpError == null) {
                // If OTP is valid, close the dialog
                Navigator.pop(context);
                // Your further logic after validating OTP
              } else {
                // Handle invalid OTP scenario if needed
                // For example, display an error message
                // showError(context, otpError);
              }
            },
            text: 'Submit',
          ),
        ],
      ),
    );
  }
}
