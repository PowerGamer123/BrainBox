// ignore_for_file: use_super_parameters, prefer_const_constructors_in_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/auth/auth_cubit.dart';
import 'package:my_app/cubit/user/user_cubit.dart';
import 'package:my_app/main.dart';
import 'package:my_app/screens/1/profile_screen.dart';
import 'package:my_app/components/image_widget.dart';
import 'package:my_app/screens/2/HomeScreen2.dart';
import 'package:my_app/screens/2/progress_screen.dart';

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage2> createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {
  int _selectedIndex = 1;
  late AuthCubit _authCubit;
  late UserCubit _userCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = BlocProvider.of<AuthCubit>(context);
    _userCubit = BlocProvider.of<UserCubit>(context);
  }

  final List<Widget> _screens = [
    const HomeScreen2(),
    ProgressScreen2(),
    const ProfileScreen(),
  ];

  final List<String> _pageTitles = ['Home', 'Progress', 'Profile'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToProfileScreen() {
    if (_selectedIndex != 2) {
      setState(() {
        _selectedIndex = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(context),
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: primary,
      title: Text(
        _pageTitles[_selectedIndex],
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
            child: ImageWidget(
              imagePath: 'assets/images/brainbox.jpeg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, size: 28),
            title: const Text('About Us'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about-us');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, size: 28),
            title: const Text('Settings'),
            onTap: () {},
          ),
          if (_userCubit.roles == "admin")
            ListTile(
              leading: const Icon(Icons.admin_panel_settings, size: 28),
              title: const Text('Admin'),
              onTap: () {},
            ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, size: 28),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
              _userCubit.logout();
              _authCubit.logout();
            },
          ),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt, size: 30),
          label: 'Progress',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 30),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey[400],
      backgroundColor: primary,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
