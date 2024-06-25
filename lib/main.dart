import 'dart:ui';

import 'package:chatbot/src/constants.dart';
import 'package:chatbot/src/data/providers/AuthProvider.dart';
import 'package:chatbot/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()..tryAutoLogin()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20 , fontWeight: FontWeight.w500),
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          textTheme: GoogleFonts.robotoSerifTextTheme(
            Theme.of(context).textTheme,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            //contentPadding: EdgeInsets.all(defaultPadding * 0.5),
            hintStyle: TextStyle(color: bodyTextColor),
          )),
      home: SplashScreen(),
    );
  }
}
