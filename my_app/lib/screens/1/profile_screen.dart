// ignore_for_file: use_super_parameters, prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/cubit/user/user_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: _buildProfileBody(context, state),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Profile',
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: Colors.white,
        ),
      ),
      backgroundColor: Color.fromARGB(255, 245, 175, 56),
    );
  }

  Widget _buildProfileBody(BuildContext context, UserState state) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 206, 147, 27),
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 90.0,
                backgroundImage:
                    AssetImage('assets/images/img_memoji_124x124.png'),
              ),
              SizedBox(height: 30.0),
              _buildProfileInfo(context, 'User ID', state.userID.toString(),
                  Icons.account_circle, null),
              _buildProfileInfo(context, 'Username', state.full_name.toString(),
                  Icons.person, null),
              _buildProfileInfo(
                  context,
                  'Email',
                  state.email ?? 'Not set',
                  Icons.email,
                  () => _showEditDialog(
                      context, 'Email', context.read<UserCubit>())),
              _buildProfileInfo(
                  context,
                  'Contact',
                  state.phone ?? 'Not set',
                  Icons.phone,
                  () => _showEditDialog(
                      context, 'Contact', context.read<UserCubit>())),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(BuildContext context, String label, String value,
      IconData iconData, VoidCallback? onEdit) {
    return ProfileInfoItem(
      label: label,
      value: value,
      iconData: iconData,
      onEdit: onEdit,
    );
  }

  void _showEditDialog(
      BuildContext context, String label, UserCubit userCubit) {
    final TextEditingController _editController = TextEditingController();
    String initialValue;

    switch (label) {
      case 'Email':
        initialValue = userCubit.state.email ?? '';
        break;
      case 'Contact':
        initialValue = userCubit.state.phone ?? '';
        break;
      default:
        initialValue = '';
    }

    _editController.text = initialValue;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Edit $label',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: Colors.black,
            ),
          ),
          content: TextField(
            controller: _editController,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: GoogleFonts.roboto(
                fontSize: 18.0,
              ),
            ),
            style: GoogleFonts.roboto(
              fontSize: 18.0,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                String newValue = _editController.text;
                switch (label) {
                  case 'Email':
                    userCubit.updateProfile(
                        email: newValue, userID: userCubit.state.userID);
                    break;
                  case 'Contact':
                    userCubit.updateProfile(
                        phone: newValue, userID: userCubit.state.userID);
                    break;
                  default:
                }
                Navigator.of(context).pop();
              },
              child: Text(
                'Save',
                style: GoogleFonts.roboto(
                  fontSize: 18.0,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProfileInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData iconData;
  final VoidCallback? onEdit;

  const ProfileInfoItem({
    Key? key,
    required this.label,
    required this.value,
    required this.iconData,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Icon(
                iconData,
                color: Colors.blue,
                size: 30.0,
              ),
              title: Text(
                value,
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              trailing: onEdit != null
                  ? IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue, size: 30.0),
                      onPressed: onEdit!,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
