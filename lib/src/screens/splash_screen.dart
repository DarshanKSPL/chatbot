import 'package:chatbot/src/constants.dart';
import 'package:chatbot/src/data/providers/AuthProvider.dart';
import 'package:chatbot/src/screens/MainHomeScreen.dart';
import 'package:chatbot/src/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<StatefulWidget> {
  double opacityLevel = 1.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      opacityLevel = 1;
    });
    _checkUserLoginAndNavigate();
  }

  void _checkUserLoginAndNavigate() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.tryAutoLogin();
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => authProvider.user != null
                  ? const MainHomeScreen()
                  : const SignInScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: const Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                    color: primaryColor, shape: BoxShape.circle),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.chat, size: 40, color: Colors.white),
                      Text(
                        "Chat Bot",
                        style: GoogleFonts.robotoSerif(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Text(
                  "Welcome to our AI powered chat app",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: bodyTextColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
