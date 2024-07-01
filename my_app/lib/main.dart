// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/auth/auth_cubit.dart';
import 'package:my_app/cubit/user/user_cubit.dart';
import 'package:my_app/login/login_screen.dart';
import 'package:my_app/login/register.dart';
import 'package:my_app/screens/1/HomeScreen.dart';
import 'package:my_app/screens/1/about_us_screen.dart';
import 'package:my_app/screens/1/myhomepage.dart';
import 'package:my_app/screens/1/profile_screen.dart';

//Global
const Color bases = Color.fromARGB(255, 255, 255, 255);
const Color primary = Color.fromARGB(255, 255, 255, 255);
const Color secondary = Color(0xFFC4985C);
String namaApp = 'Brain Box';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<UserCubit>(create: (context) => UserCubit()),
      ],
      child: MaterialApp(
        title: 'Brain Box',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: '/login',
        debugShowCheckedModeBanner: false,
        routes: {
          '/main': (context) => const MyApp(),
          '/home-screen': (context) => HomeScreen(),
          '/about-us': (context) => AboutUsScreen(),
          '/register': (context) => RegisterScreen(),
          '/login': (context) => LoginScreen(),
          '/navi': (context) => MyHomePage(
                title: 'navigation',
              ),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}
