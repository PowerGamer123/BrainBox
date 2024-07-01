// ignore_for_file: unnecessary_type_check, prefer_const_constructors, avoid_print, depend_on_referenced_packages, non_constant_identifier_names, unnecessary_cast

import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_app/services/data_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserInitialState());

  void login(String roles, int userID, String username, String? email,
      String? full_name, String? phone, String? profile_picture) {
    emit(UserState(
      roles: roles,
      userID: userID,
      username: username,
      email: email,
      full_name: full_name,
      phone: phone,
      profile_picture: profile_picture,
    ));
  }

  Future<void> updateProfile({
    int? userID,
    String? email,
    String? full_name,
    String? phone,
    String? profile_picture,
  }) async {
    if (state is UserState) {
      emit((state as UserState).copyWith(
        email: email,
        full_name: full_name,
        phone: phone,
        profile_picture: profile_picture,
      ));
      try {
        final response =
            await DataService.updateUser(userID!, email, full_name, phone);
        if (response.statusCode == 200) {
          print(response.body);
        } else {
          print('Failed to update profile: ${response.statusCode}');
        }
      } catch (e) {
        print('Error updating profile: $e');
      }
    }
  }

  void logout() {
    emit(const UserState(
      roles: '',
      userID: 0,
      username: '',
      email: null,
      full_name: null,
      phone: null,
      profile_picture: null,
    ));
  }

  int get userID => state.userID;

  String get roles => state.roles;
}
