import 'package:chatbot/src/constants.dart';
import 'package:chatbot/src/data/models/User.dart';
import 'package:chatbot/src/data/providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    super.dispose();
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
    print("User: ${user?.toJson()}");
    _firstNameController.text = user?.firstName ?? "";
    _lastNameController.text = user?.lastName ?? "";
    _emailController.text = user?.username ?? "";

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Profile",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: defaultPadding * 2),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: primaryColor,
                  child: Text(
                    getInitials(user?.firstName),
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),

                //First Name
                TextFormField(
                  controller: _firstNameController,
                  validator: requiredValidator,
                  onSaved: (value) {},
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: "First Name"),
                ),
                const SizedBox(height: defaultPadding),

                //Last Name
                TextFormField(
                  controller: _lastNameController,
                  validator: requiredValidator,
                  onSaved: (value) {},
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: "Last Name"),
                ),
                const SizedBox(height: defaultPadding),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  validator: emailValidator,
                  onSaved: (value) {},
                  enabled: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: "Email Address"),
                ),
                const SizedBox(height: defaultPadding),

                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      //Update the user details
                      var user = User(
                          username: _emailController.text,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text);
                      context.read<AuthProvider>().updateUser(user).then((_) {
                        Navigator.pop(context);
                        showSnackBar(context, "Profile updated successfully");
                      });
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
