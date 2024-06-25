import 'package:chatbot/src/components/sign_in_form.dart';
import 'package:chatbot/src/constants.dart';
import 'package:chatbot/src/screens/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../components/welcome_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Log In",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeText(
                title: "Welcome to Chat",
                text: "Enter your Email address and \npassword for sign in.",
              ),
              const SignInForm(),
              const SizedBox(height: defaultPadding),
              Center(
                  child: Text("Or",
                      style: TextStyle(color: titleColor.withOpacity(0.7)))),
              const SizedBox(height: defaultPadding * 1.5),
              Center(
                child: Text.rich(
                  TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w600),
                    text: "Don’t have account? ",
                    children: <TextSpan>[
                      TextSpan(
                        text: "Create new account.",
                        style: const TextStyle(color: primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen())),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
