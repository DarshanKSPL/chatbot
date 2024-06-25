import 'dart:convert';

class User {
  final String firstName;
  final String lastName;
  final String username;

  User(
      {required this.username,
      required this.firstName,
      required this.lastName});

  // Convert User to a Map
  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'],
      lastName: map['lastName'],
      username: map['username'],
    );
  }

  // Convert User to JSON
  String toJson() {
    return jsonEncode(toMap());
  }

  // Create User from JSON
  factory User.fromJson(String json) {
    return User.fromMap(jsonDecode(json));
  }
}
