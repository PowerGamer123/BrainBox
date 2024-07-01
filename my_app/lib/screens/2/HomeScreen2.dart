// ignore_for_file: file_names, library_private_types_in_public_api, use_super_parameters, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/user/user_cubit.dart';
import 'package:my_app/screens/1/course_screen_che.dart';
import 'package:my_app/screens/1/course_screen_phy.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  _HomeScreenState2 createState() => _HomeScreenState2();
}

class _HomeScreenState2 extends State<HomeScreen2> {
  late String _fullName;

  @override
  void initState() {
    super.initState();
    _loadFullName();
  }

  void _loadFullName() {
    final userCubit = BlocProvider.of<UserCubit>(context);
    _fullName = userCubit.state.full_name ?? ''; // Fetch full name from state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              _buildSectionTitle('Continue Course'),
              _buildContinueCourseSection(context),
              _buildSectionTitle('Featured Course'),
              _buildFeaturedCourseSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.deepOrangeAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, $_fullName', // Display the full name here
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            'What would you like to learn today?',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }

  Widget _buildContinueCourseSection(BuildContext context) {
    return Container(
      height: 220.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildClickableCourseItem(
            context,
            title: 'Physics',
            progress: '2/20',
            progressPercentage: 0.10,
            imagePath: 'assets/images/phy.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CourseScreenPHY(courseTitle: 'Physics Course'),
                ),
              );
            },
          ),
          SizedBox(width: 16.0),
          _buildClickableCourseItem(
            context,
            title: 'Chemistry',
            progress: '0/20',
            progressPercentage: 0,
            imagePath: 'assets/images/che.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CourseScreenCHE(courseTitle: 'Chemistry Course'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedCourseSection(BuildContext context) {
    return Container(
      height: 220.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFeaturedCourseItem(
            context,
            title: 'Biology',
            description: 'Exploring the wonders of life.',
            imagePath: 'assets/images/bio.jpg',
          ),
          SizedBox(width: 16.0),
          _buildFeaturedCourseItem(
            context,
            title: 'Mathematics',
            description: 'Unlock the power of patterns.',
            imagePath: 'assets/images/math.jpg',
          ),
        ],
      ),
    );
  }

  Widget _buildClickableCourseItem(
    BuildContext context, {
    required String title,
    required String progress,
    required double progressPercentage,
    required String imagePath,
    required Function() onTap,
  }) {
    return Container(
      width: 180.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.asset(
                  imagePath,
                  width: 180.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      progress,
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 8.0),
                    LinearProgressIndicator(
                      value: progressPercentage,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedCourseItem(
    BuildContext context, {
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Container(
      width: 180.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.asset(
                  imagePath,
                  width: 180.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
