import 'package:chatbot/src/constants.dart';
import 'package:chatbot/src/data/models/User.dart';
import 'package:chatbot/src/data/providers/AuthProvider.dart';
import 'package:chatbot/src/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  //const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            child: Text(
              getFullName(user),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle navigation to Home
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () {
              // Handle navigation to Profile
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle navigation to Settings
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout
              Navigator.pop(context); // Close the drawer

              //Navigate user to login screen
              context.read<AuthProvider>().logout().then((_) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              });
            },
          ),
        ],
      ),
    );
  }

  String getFullName(User? user) {
    if (user != null) {
      return '${user.firstName} ${user.lastName}';
    }
    return '';
  }
}
