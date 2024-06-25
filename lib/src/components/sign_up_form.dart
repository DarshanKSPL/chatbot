import 'package:chatbot/src/constants.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //First Name
          TextFormField(
            validator: requiredValidator,
            onSaved: (value) {},
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: "First Name"),
          ),
          const SizedBox(height: defaultPadding),

          //Last Name
          TextFormField(
            validator: requiredValidator,
            onSaved: (value) {},
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: "Last Name"),
          ),
          const SizedBox(height: defaultPadding),

          // Email Field
          TextFormField(
            validator: emailValidator,
            onSaved: (value) {},
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: "Email Address"),
          ),
          const SizedBox(height: defaultPadding),

          // Password Field
          TextFormField(
            obscureText: _obscureText,
            validator: passwordValidator,
            textInputAction: TextInputAction.next,
            onChanged: (value) {},
            onSaved: (value) {},
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

          // Confirm Password Field
          TextFormField(
            obscureText: _obscureText,
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

          // Sign Up Button
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                //TODO : Handle new user signup
                Navigator.pop(context);
              }
            },
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
  }
}
