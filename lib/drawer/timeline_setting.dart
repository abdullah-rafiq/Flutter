import 'package:flutter/material.dart';

class TimelineSetting extends StatefulWidget {
  const TimelineSetting({super.key});

  @override
  State<TimelineSetting> createState() => _TimelineSettingState();
}

class _TimelineSettingState extends State<TimelineSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Timeline Setting",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nothing to see here yet.",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16), // Add some spacing between the texts
            Text(
              "Try pinning a List or a Community to give easiest access to your favorite content.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
