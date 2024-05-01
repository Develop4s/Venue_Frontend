import 'dart:async';

import 'package:flutter/material.dart';
import 'package:venue/components/custom_button.dart';
import 'package:venue/components/snack_bar.dart';
import 'package:venue/screens/user/otp_popup.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController _emailController = TextEditingController();
  String? _emailValidationError;

  // Email validation method
  String? _validateEmail(String value) {
    final RegExp emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      setState(() {
        _emailValidationError = 'Enter a valid email address';
      });
      return 'Enter a valid email address';
    } else {
      setState(() {
        _emailValidationError = null;
      });
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double paddingleft = screenSize.width * 0.05;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.25,
                        left: paddingleft),
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: paddingleft),
                    child: Text(
                      'Please enter your email address \nto request a password reset',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: paddingleft),
                    child: Container(
                      padding: EdgeInsets.only(left: paddingleft),
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
                      child: Row(
                        children: [
                          Icon(
                            Icons.mail_rounded,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: "abc@email.com",
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                // Call the validation method when the text changes
                                _validateEmail(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Center(
                    child: Column(
                      children: [
                        CustomButton(
                          onPressed: () {
                            // Validate email before showing OTP popup
                            String? emailError =
                                _validateEmail(_emailController.text);
                            if (emailError == null) {
                              // Email is valid, show OTP popup
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => OtpPopup(),
                              );
                            } else {
                              // Show error message for invalid email
                              showError(context, emailError);
                            }
                          },
                          text: 'SEND',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.10,
              left: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Handle navigation to previous screen
                },
              ),
            ),
            Positioned(
              right: 0,
              top: MediaQuery.of(context).size.height * 0.06,
              child: Image.asset(
                'assets/images/Vectorbg1.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
