// ignore_for_file: use_super_parameters, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProgressScreen2 extends StatefulWidget {
  ProgressScreen2({Key? key}) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen2> {
  String _selectedCourse = "Physics"; // Default selected course
  final double _defaultPadding = 12.0;
  final double _progressChartWidth = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgressHeader(),
            SizedBox(height: _defaultPadding),
            _buildCourseDropdown(),
            SizedBox(height: _defaultPadding),
            _buildTitleSection(),
            SizedBox(height: _defaultPadding),
            _buildProgressChart(),
            SizedBox(height: _defaultPadding),
            _buildCompletedCourseSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressHeader() {
    return Container(
      width:
          double.infinity, // Ensure the container fills the width of the screen
      padding: EdgeInsets.all(_defaultPadding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orangeAccent, Colors.deepOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Progress",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            "Track your learning journey",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseDropdown() {
    return Padding(
      padding: EdgeInsets.all(_defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Course",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: _defaultPadding),
          DropdownButton<String>(
            value: _selectedCourse,
            items: ["Physics", "Biology", "Chemistry", "Mathematics"]
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedCourse = value!;
              });
            },
            hint: Text("Select Course"),
            style: TextStyle(color: Colors.black, fontSize: 16),
            dropdownColor: Colors.white,
            iconEnabledColor: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Padding(
      padding: EdgeInsets.all(_defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Progress: 0 Courses Completed",
              style: TextStyle(fontSize: 18)),
          SizedBox(height: _defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < 7; i++)
                Expanded(
                  child: Text(
                    _getDayOfWeek(i),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
            ],
          ),
          SizedBox(height: _defaultPadding),
        ],
      ),
    );
  }

  Widget _buildProgressChart() {
    return Padding(
      padding: EdgeInsets.all(_defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (index) {
          return Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: _getChartHeight(index),
                  width: _progressChartWidth,
                  decoration: BoxDecoration(
                    color: _getChartColor(index),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCompletedCourseSection() {
    return Padding(
      padding: EdgeInsets.all(_defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Completed Courses",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: _defaultPadding),
          Container(
            padding: EdgeInsets.all(_defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.play_arrow, size: 40, color: Colors.orange),
                SizedBox(width: _defaultPadding),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Electricity 1", style: TextStyle(fontSize: 18)),
                    SizedBox(height: _defaultPadding / 2),
                    Text("Basic Physics",
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey)),
                  ],
                ),
                Spacer(),
                Icon(Icons.check_circle, size: 35, color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getDayOfWeek(int index) {
    List<String> daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return daysOfWeek[index];
  }

  double _getChartHeight(int index) {
    // Sample data for progress of different courses
    Map<String, List<double>> courseProgress = {
      "Physics": [2, 0, 0, 0, 0, 0, 0],
      "Biology": [0, 0, 0, 0, 0, 0, 0],
      "Chemistry": [0, 0, 0, 0, 0, 0, 0],
      "Mathematics": [0, 0, 0, 0, 0, 0, 0],
    };

    // Retrieve progress data based on the selected course
    List<double> heights = courseProgress[_selectedCourse] ?? [];

    // If progress data is not available, return 0 for all days
    if (heights.isEmpty) {
      return 0.0;
    }

    // Return progress data for the specified day index
    return heights[index];
  }

  Color _getChartColor(int index) {
    if (index == 6) {
      return Colors.orange;
    }
    return Colors.blueGrey[100]!;
  }
}
