// ignore_for_file: use_super_parameters, prefer_const_constructors, prefer_const_declarations, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class CourseScreenCHE extends StatelessWidget {
  final String courseTitle;

  const CourseScreenCHE({Key? key, required this.courseTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseTitle),
        elevation: 0, // Remove appbar shadow
        centerTitle: true,
        backgroundColor: Colors.blueAccent, // Change appbar color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCompletedCourseSection(), // Completed section at the top
            SizedBox(height: 20), // Add space between sections
            _buildIncompleteLessonSection(), // Incomplete section at the bottom
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedCourseSection() {
    final double _defaultPadding = 16.0;

    return Padding(
      padding: EdgeInsets.all(_defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Completed Course",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green), // Change text color and size
          ),
        ],
      ),
    );
  }

  Widget _buildIncompleteLessonSection() {
    final double _defaultPadding = 16.0;

    return Padding(
      padding: EdgeInsets.all(_defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Incomplete Lessons",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange), // Change text color and size
          ),
          SizedBox(height: _defaultPadding),
          _buildCourseItem(
              "Elements 1", "Basic Chemistry", Icons.play_arrow, Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Compounds 1", "Basic Chemistry", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Reactions 1", "Basic Chemistry", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Electrochemistry 1", "Basic Chemistry",
              Icons.play_arrow, Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem(
              "Elements 2", "Basic Chemistry", Icons.play_arrow, Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Compounds 2", "Basic Chemistry", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Reactions 2", "Basic Chemistry", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Electrochemistry 2", "Basic Chemistry",
              Icons.play_arrow, Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem(
              "Elements 3", "Basic Chemistry", Icons.play_arrow, Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Compounds 3", "Basic Chemistry", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Reactions 3", "Basic Chemistry", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Electrochemistry 3", "Basic Chemistry",
              Icons.play_arrow, Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Compounds 4", "Basic Chemistry", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Reactions 4", "Basic Chemistry", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Electrochemistry 4", "Basic Chemistry",
              Icons.play_arrow, Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Elements 4", "Chemical Bonding", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Elements 5", "Chemical Bonding", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Compounds 5", "Chemical Bonding", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Reactions 5", "Chemical Bonding", Icons.play_arrow,
              Colors.orange),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Electrochemistry 5", "Chemical Bonding",
              Icons.play_arrow, Colors.orange),
        ],
      ),
    );
  }

  Widget _buildCourseItem(
      String title, String subTitle, IconData icon, Color iconColor) {
    final double _defaultPadding = 16.0;

    return Container(
      padding: EdgeInsets.all(_defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: iconColor),
          SizedBox(width: _defaultPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 18)),
              SizedBox(height: _defaultPadding),
              Text(subTitle,
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey)),
            ],
          ),
          Spacer(),
          Icon(Icons.check_circle, size: 35, color: Colors.green),
        ],
      ),
    );
  }
}
