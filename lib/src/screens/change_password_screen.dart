import 'package:chatbot/src/components/welcome_text.dart';
import 'package:chatbot/src/constants.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Change Password",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(
                title: "Want to change your password?",
                text:
                    "Enter your old password and new password \nto change your current password."),
            SizedBox(height: defaultPadding),
            ChangePasswordForm(),
          ],
        ),
      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({
    super.key,
  });

  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  String oldPassword = "", newPassword = "", confirmPassword = "";

  String? confirmPasswordValidator(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Old Password Field
          TextFormField(
            validator: requiredValidator,
            onChanged: (value) {
              oldPassword = value;
            },
            onSaved: (value) {},
            decoration: const InputDecoration(hintText: "Old Password"),
          ),
          const SizedBox(height: defaultPadding),

          // Password Field
          TextFormField(
            obscureText: _obscureText,
            validator: passwordValidator,
            textInputAction: TextInputAction.next,
            onChanged: (value) {
              newPassword = value;
            },
            onSaved: (value) {},
            decoration: InputDecoration(
              hintText: "New Password",
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

          // Confirm Password Field
          TextFormField(
            obscureText: _obscureText,
            onChanged: (value) {
              confirmPassword = value;
            },
            onSaved: (value) {},
            validator: (value) => confirmPasswordValidator(value, newPassword),
            decoration: InputDecoration(
              hintText: "Confirm Password",
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
            child: const Text("Change Password"),
          ),
        ],
      ),
    );
  }
}
