// ignore_for_file: prefer_const_constructors, use_super_parameters, prefer_const_declarations, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:my_app/screens/1/recap_screen.dart';
import 'package:my_app/screens/2/myhomepage2.dart';

class CourseScreenPHY2 extends StatelessWidget {
  final String courseTitle;

  const CourseScreenPHY2({Key? key, required this.courseTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseTitle),
        elevation: 0, // Remove appbar shadow
        centerTitle: true,
        backgroundColor: Colors.orangeAccent, // Change appbar color
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage2(
                        title: 'home page2',
                      )),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCompletedCourseSection(context),
            SizedBox(height: 20),
            _buildIncompleteLessonSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedCourseSection(BuildContext context) {
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
          SizedBox(height: _defaultPadding),
          _buildCourseItem2("Mechanics 1", "Basic Physics", Icons.play_arrow,
              Colors.green, context),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Electricity 1", "Basic Physics", Icons.play_arrow,
              Colors.green, true),
          SizedBox(height: _defaultPadding),
        ],
      ),
    );
  }

  Widget _buildIncompleteLessonSection(BuildContext context) {
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
                color: Colors.orange),
          ),
          _buildCourseItem("Thermodynamics 1", "Basic Physics",
              Icons.play_arrow, Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Optics 1", "Basic Physics", Icons.play_arrow,
              Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Mechanics 2", "Basic Physics", Icons.play_arrow,
              Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Thermodynamics 2", "Basic Physics",
              Icons.play_arrow, Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem(
              "Optics 2", "Magnetism", Icons.play_arrow, Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Mechanics 3", "Magnetism", Icons.play_arrow,
              Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Thermodynamics 3", "Magnetism", Icons.play_arrow,
              Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Quantum Physics 1", "Advanced Physics",
              Icons.play_arrow, Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Relativity 1", "Advanced Physics", Icons.play_arrow,
              Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Nuclear Physics 1", "Advanced Physics",
              Icons.play_arrow, Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Astrophysics 1", "Advanced Physics",
              Icons.play_arrow, Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Particle Physics 1", "Advanced Physics",
              Icons.play_arrow, Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Thermodynamics 4", "Advanced Physics",
              Icons.play_arrow, Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Solid State Physics 1", "Advanced Physics",
              Icons.play_arrow, Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Plasma Physics 1", "Advanced Physics",
              Icons.play_arrow, Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Geophysics 1", "Earth Sciences", Icons.play_arrow,
              Colors.orange, false),
          SizedBox(height: _defaultPadding),
          _buildCourseItem("Biophysics 1", "Life Sciences", Icons.play_arrow,
              Colors.orange, false),
          SizedBox(height: _defaultPadding),
        ],
      ),
    );
  }

  Widget _buildCourseItem(String title, String subTitle, IconData icon,
      Color iconColor, bool isComplete) {
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
          if (isComplete)
            Icon(Icons.check_circle, size: 35, color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildCourseItem2(String title, String subTitle, IconData icon,
      Color iconColor, BuildContext context) {
    final double _defaultPadding = 16.0;

    return Container(
      padding: EdgeInsets.all(_defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(icon, size: 40, color: iconColor),
            onTap: () {
              if (title == "Mechanics 1") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecapScreen(),
                  ),
                );
              }
            },
          ),
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
