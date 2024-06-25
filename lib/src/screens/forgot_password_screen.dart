import 'package:chatbot/src/components/welcome_text.dart';
import 'package:chatbot/src/constants.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeText(
                  title: "Forgot your password?",
                  text:
                      "Enter your email address and we will \nsend you a reset instructions."),
              SizedBox(height: defaultPadding),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({
    super.key,
  });

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            validator: emailValidator,
            onSaved: (value) {},
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email Address"),
          ),
          const SizedBox(height: defaultPadding),

          // Reset password Button
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // If all data are correct then save data to out variables
                _formKey.currentState!.save();
                Navigator.pop(
                  context,
                );
              }
            },
            child: const Text("Send Email"),
          ),
        ],
      ),
    );
  }
}
