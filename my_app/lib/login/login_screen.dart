// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, non_constant_identifier_names, use_super_parameters, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/components/image_widget.dart';
import 'package:my_app/components/button.dart';
import 'package:my_app/components/text_field.dart';
import 'package:my_app/cubit/auth/auth_cubit.dart';
import 'package:my_app/cubit/user/user_cubit.dart';
import 'package:my_app/dto/login.dart';
import 'package:my_app/main.dart';
import 'package:my_app/services/data_service.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/utils/secure_storage_util.dart';
import 'dart:convert';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _sendLogin(
      BuildContext context, AuthCubit authCubit, UserCubit userCubit) async {
    final email = _usernameController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      debugPrint("Email or password cannot be empty");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email or password cannot be empty")),
      );
      return;
    }

    final response = await DataService.sendLoginData(email, password);
    if (response.statusCode == 200) {
      debugPrint("Login successful");
      final data = jsonDecode(response.body);
      final loggedIn = Login.fromJson(data);
      await SecureStorageUtil.storage
          .write(key: tokenStoreName, value: loggedIn.accessToken);

      final userInfoResponse =
          await DataService.getUserInfo(loggedIn.accessToken);
      if (userInfoResponse != null && userInfoResponse.statusCode == 200) {
        final userInfo = jsonDecode(userInfoResponse.body);
        final roles = userInfo['roles'];
        final userID = userInfo['user_logged'];
        final username = userInfo['username'];

        final profileInfoResponse =
            await DataService.getUserAdditionalInfo(userID);
        if (profileInfoResponse.statusCode == 200) {
          final profileInfo = jsonDecode(profileInfoResponse.body);
          final email = profileInfo['data']['email'];
          final full_name = profileInfo['data']['full_name'];
          final phone = profileInfo['data']['phone'];
          final profile_picture = profileInfo['data']['profile_picture'];

          userCubit.login(roles, userID, username, email, full_name, phone,
              profile_picture);

          Navigator.pushReplacementNamed(context, "/navi");
          debugPrint("Access token: ${loggedIn.accessToken}");
        } else {
          debugPrint(
              "Failed to fetch profile info ${profileInfoResponse.statusCode}");
        }
      } else {
        debugPrint("Failed to fetch user info ${userInfoResponse?.statusCode}");
      }
    } else {
      debugPrint("Login failed ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final userCubit = BlocProvider.of<UserCubit>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  ImageWidget(
                    imagePath: 'assets/images/brainbox.jpeg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Login to Your Account",
                    style: GoogleFonts.manrope(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFieldstate(
                    controller: _usernameController,
                    hintText: 'Enter your username',
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  TextFieldstate(
                    controller: _passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text('Register Now'),
                      ),
                    ],
                  ),
                  Button(
                    childColor: secondary,
                    buttonText: 'Login',
                    onPressed: () {
                      _sendLogin(context, authCubit, userCubit);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
