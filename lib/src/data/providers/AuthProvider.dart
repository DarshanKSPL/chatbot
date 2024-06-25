import 'package:chatbot/src/data/models/User.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> login(User user) async {
    // Simulate a login process
    _user = user;
    // Save the user data in shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user.toJson());
    notifyListeners();
  }

  Future<void> updateUser(User user) async {
    // Simulate a login process
    _user = user;
    // Save the user data in shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', user.toJson());
    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    notifyListeners();
  }

  Future<void> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('user')) {
      return;
    }
    final userString = prefs.getString('user');
    if (userString != null) {
      _user = User.fromJson(userString);
      notifyListeners();
    }
    notifyListeners();
  }
}
