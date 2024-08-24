import 'package:chatbot/src/components/app_drawer.dart';
import 'package:chatbot/src/constants.dart';
import 'package:chatbot/src/data/providers/AuthProvider.dart';
import 'package:chatbot/src/screens/change_password_screen.dart';
import 'package:chatbot/src/screens/chat_screen.dart';
import 'package:chatbot/src/screens/edit_profile_screen.dart';
import 'package:chatbot/src/screens/privacy_policy_screen.dart';
import 'package:chatbot/src/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ChatScreen(),
    const EditProfileScreen(),
    const ChangePasswordScreen(),
    const PrivacyPolicyScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black54,
        title: const Text(
          "ChatBot",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        //actions: [getPopupOptionMenu(context)],
      ),
      drawer: AppDrawer(
        onItemTapped: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
    );
  }

  getPopupOptionMenu(BuildContext context) {
    return PopupMenuButton<MenuOptions>(
      key: const ValueKey<String>('ShowPopupMenu'),
      icon: const Icon(Icons.more_vert),
      onSelected: (MenuOptions result) {
        switch (result) {
          case MenuOptions.PROFILE:
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const EditProfileScreen()),
            );
            break;
          case MenuOptions.CHANGE_PASSWORD:
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const ChangePasswordScreen()),
            );
            break;
          case MenuOptions.PRIVACY_POLICY:
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const PrivacyPolicyScreen()),
            );
            break;
          case MenuOptions.LOGOUT:
            context.read<AuthProvider>().logout().then((_) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SignInScreen()),
              );
            });
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuOptions>>[
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.PROFILE,
          child: Text('Edit Profile'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.CHANGE_PASSWORD,
          child: Text('Change Password'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.PRIVACY_POLICY,
          child: Text('Privacy Policy'),
        ),
        const PopupMenuItem<MenuOptions>(
          value: MenuOptions.LOGOUT,
          child: Text('Logout'),
        ),
      ],
    );
  }
}
