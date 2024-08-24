import 'package:chatbot/src/constants.dart';
import 'package:chatbot/src/data/models/User.dart';
import 'package:chatbot/src/data/providers/AuthProvider.dart';
import 'package:chatbot/src/screens/MainHomeScreen.dart';
import 'package:chatbot/src/screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String _email = "", _password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: emailValidator,
            onSaved: (value) {
              _email = value ?? "";
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email Address"),
          ),
          const SizedBox(height: defaultPadding),

          // Password Field
          TextFormField(
            obscureText: _obscureText,
            validator: passwordValidator,
            onSaved: (value) {
              _password = value ?? "";
            },
            decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: bodyTextColor)
                    : const Icon(Icons.visibility, color: bodyTextColor),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),

          // Forget Password
          SizedBox(
            width: double.infinity,
            child: GestureDetector(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen()))
              },
              child: Text(
                "Forget Password?",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),

          // Sign In Button
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                print("Email: " + _email);
                print("password: " + _password);

                //Save the user data
                var user = User(username: _email, firstName: "", lastName: "");
                context.read<AuthProvider>().login(user);
                //TODO : Validate user

                showSnackBar(context, "Sign in successful");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainHomeScreen()));
              }
            },
            child: const Text("Sign in"),
          ),
        ],
      ),
    );
  }
}
