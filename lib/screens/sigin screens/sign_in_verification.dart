import 'package:flutter/material.dart';
import 'dart:math';

class SignInVerificationSc extends StatefulWidget {
  const SignInVerificationSc({super.key});

  @override
  State<SignInVerificationSc> createState() => _SignInVerificationScState();
}

class _SignInVerificationScState extends State<SignInVerificationSc> {
  final TextEditingController _verificationController = TextEditingController();
  String? _sentCode; // The code that was sent
  bool _isCodeValid = true; // Flag for valid code

  @override
  void initState() {
    super.initState();
    _sentCode = _generateVerificationCode(); // Generate a new code when the screen is initialized
    _sendVerificationCode(); // Simulate sending the code
  }

  @override
  void dispose() {
    _verificationController.dispose();
    super.dispose();
  }

  // Simulating sending a verification code to the email
  void _sendVerificationCode() {
    print("Verification Code Sent: $_sentCode");
    // In a real-world scenario, you would send the code via email to the user's email address
  }

  // Generate a random 6-digit verification code
  String _generateVerificationCode() {
    final random = Random();
    return (random.nextInt(900000) + 100000).toString(); // Generates a 6-digit code
  }

  // Check if the entered code matches the sent code
  void _verifyCode() {
    setState(() {
      _isCodeValid = _verificationController.text == _sentCode;
    });

    if (_isCodeValid) {
      Navigator.pushReplacementNamed(context, "/home_sc"); // Proceed to next screen if valid
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid verification code, please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "/sign_next_sc");
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Image.asset(
          'assets/logo/logo.png',
          width: 20,
          height: 20,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "We sent you a code",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20.0, right: 20, bottom: 0),
            child: TextField(
              controller: _verificationController,
              decoration: InputDecoration(
                labelText: 'Verification code',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isCodeValid ? Colors.blueAccent : Colors.red,
                    width: 1.0,
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  // Simulate resending the code
                  setState(() {
                    _sentCode = _generateVerificationCode();
                  });
                  _sendVerificationCode();
                },
                child: const Text(
                  "Resend code",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: _verifyCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
