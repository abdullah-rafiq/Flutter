import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset(
          'assets/logo/logo.png',
          width: 20,
          height: 20,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0, // Remove shadow for a cleaner look
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Adding padding for better spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            const CircleAvatar(
              radius: 50, // Adjust size of the profile picture
              backgroundImage: AssetImage('assets/profile_image.png'), // Use your profile image
            ),
            const SizedBox(height: 20), // Space between profile image and text
            
            // Name
            const Text(
              'John Doe', // Replace with dynamic name if needed
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),

            // Email
            const Text(
              'johndoe@example.com', // Replace with dynamic email if needed
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30), // Space before the buttons

            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                // Add your onPressed functionality here
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Full width button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 20),

            // Log Out Button
            ElevatedButton(
              onPressed: () {
                // Add your log out functionality here
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Full width button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
