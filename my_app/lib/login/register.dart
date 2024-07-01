// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, use_super_parameters

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/components/image_widget.dart';
import 'package:my_app/components/button.dart';
import 'package:my_app/components/text_field.dart';
import 'package:my_app/endpoints/endpoints.dart';
import 'package:my_app/main.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _sendRegister(BuildContext context) async {
    final username = _usernameController.text;
    final fullName = _fullNameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final password = _passwordController.text;

    if (username.isEmpty ||
        fullName.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty) {
      debugPrint("All fields are required");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    final url = Uri.parse(Endpoints.register);
    final response = await http.post(
      url,
      body: {
        'username': username,
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'password': password,
      },
    );

    if (response.statusCode == 201) {
      // Handle successful registration
      debugPrint("Registration successful");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration successful")),
      );
      Navigator.pop(context); // Pop the screen on successful registration
    } else {
      // Handle registration failure
      debugPrint("Registration failed: ${response.statusCode}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration failed: ${response.statusCode}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
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
                    "Register Your Account",
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
                    controller: _fullNameController,
                    hintText: 'Enter your full name',
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  TextFieldstate(
                    controller: _emailController,
                    hintText: 'Enter your email',
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  TextFieldstate(
                    controller: _phoneController,
                    hintText: 'Enter your phone number',
                    obscureText: false,
                  ),
                  SizedBox(height: 10),
                  TextFieldstate(
                    controller: _passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  Button(
                    childColor: secondary,
                    buttonText: 'Register',
                    onPressed: () => _sendRegister(context),
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
