// ignore_for_file: non_constant_identifier_names

class User {
  String roles;
  int userId; // Changed to camelCase
  String username;
  String? email;
  String? fullName; // Changed to camelCase
  String? phone;
  String? profilePicture; // Changed to camelCase

  User({
    required this.roles,
    required this.userId,
    required this.username,
    this.email,
    this.fullName,
    this.phone,
    this.profilePicture,
  });

  // Factory constructor to create a User object from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      roles: json['roles'],
      userId: json['userID'], // Adjusted to camelCase
      username: json['username'],
      email: json['email'],
      fullName: json['full_name'], // Adjusted to camelCase
      phone: json['phone'],
      profilePicture: json['profile_picture'], // Adjusted to camelCase
    );
  }

  // Method to convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'roles': roles,
      'userID': userId, // Adjusted to camelCase
      'username': username,
      'email': email,
      'full_name': fullName, // Adjusted to camelCase
      'phone': phone,
      'profile_picture': profilePicture, // Adjusted to camelCase
    };
  }

  @override
  String toString() {
    return 'User{roles: $roles, userId: $userId, username: $username, email: $email, fullName: $fullName, phone: $phone, profilePicture: $profilePicture}';
  }
}
