import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  bool _isEmailValid = true;
  bool _isDobValid = true;

  @override
  void dispose() {
    emailController.dispose();
    dobController.dispose();
    super.dispose();
  }

  bool validateEmail(String email) {
    // Basic email regex pattern for validation
    String pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool validateDateOfBirth(String dob) {
    // Basic check for DOB format (dd/mm/yyyy or mm/dd/yyyy)
    String pattern = r'^(0[1-9]|1[0-9]|2[0-9]|3[01])[-/](0[1-9]|1[0-2])[-/](\d{4})$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(dob);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, "/splash_sc");
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
      resizeToAvoidBottomInset: true, // Adjust content for keyboard
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Create your account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Name Input
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                ),
              ),
              maxLength: 50,
            ),
            const SizedBox(height: 10),
            // Email Input
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isEmailValid ? Colors.grey : Colors.red,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isEmailValid ? Colors.blueAccent : Colors.red,
                    width: 1.0,
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z0-9@._-]')), // Allow email characters
              ],
              onChanged: (value) {
                // Validate the email whenever the user types
                setState(() {
                  _isEmailValid = validateEmail(value);
                });
              },
            ),
            const SizedBox(height: 30),
            // Date of Birth Input
            TextField(
              controller: dobController,
              decoration: InputDecoration(
                labelText: 'Date of Birth (DD/MM/YYYY)',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isDobValid ? Colors.grey : Colors.red,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isDobValid ? Colors.blueAccent : Colors.red,
                    width: 1.0,
                  ),
                ),
              ),
              keyboardType: TextInputType.datetime,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9/-]')),
              ],
              onChanged: (value) {
                // Validate the DOB whenever the user types
                setState(() {
                  _isDobValid = validateDateOfBirth(value);
                });
              },
            ),
            const Spacer(), // Pushes the button to remain below the fields
            // Next Button
            Divider(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Validate all fields before proceeding
                  setState(() {
                    _isEmailValid = validateEmail(emailController.text);
                    _isDobValid = validateDateOfBirth(dobController.text);
                  });

                  // If all fields are valid, proceed to next screen
                  if (_isEmailValid && _isDobValid) {
                    Navigator.pushNamed(context, "/sign_next_sc");
                  }
                },
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
            const Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ),
    );
  }
}
