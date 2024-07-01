// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Image.asset(
                  'assets/images/brainbox.jpeg', // Replace with your company logo asset path
                  width: 150.0, // Adjust size as needed
                ),
              ),
            ),
            Text(
              'About BrainBox',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Welcome to BrainBox, your ultimate companion for mastering the sciences! Whether youre delving into the mysteries of physics, exploring the wonders of biology, deciphering the complexities of chemistry, or solving the puzzles of mathematics, BrainBox is designed to make learning engaging, efficient, and fun.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'At BrainBox, our mission is to revolutionize the way students learn and understand the sciences. We are dedicated to providing accessible, high-quality educational resources that empower learners to achieve their fullest potential.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
