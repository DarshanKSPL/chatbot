import 'package:chatbot/src/constants.dart';
import 'package:chatbot/src/data/models/User.dart';
import 'package:chatbot/src/data/providers/AuthProvider.dart';
import 'package:chatbot/src/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  final Function(int) onItemTapped;

  const AppDrawer({super.key, required this.onItemTapped});

  String getFullName(User? user) {
    if (user != null) {
      return '${user.firstName} ${user.lastName}';
    }
    return '';
  }

  String getEmail(User? user) {
    if (user != null) {
      return user.username;
    }
    return '';
  }

  String getInitials(String? name) {
    if (name != null && name.isNotEmpty) {
      return name[0].toUpperCase();
    }
    return 'C'; // Return a default string if the name is empty
  }

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: accentColor,
                  child: Text(
                    getInitials(user?.firstName),
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                Text(
                  getFullName(user),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                Text(
                  getEmail(user),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => onItemTapped(0),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () => onItemTapped(1),
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: () => onItemTapped(2),
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('Privacy Policy'),
            onTap: () => onItemTapped(3),
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
}
