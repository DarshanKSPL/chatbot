import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const titleColor = Color(0xFF010F07);
const primaryColor = Color(0xFF22A45D);
const accentColor = Color(0xFFEF9920);
const bodyTextColor = Color(0xFF868686);
const inputColor = Color(0xFFFBFBFB);
const errorColor = Color(0xFFF03738);

const double defaultPadding = 16;
const double defaultButtonHeight = 40;

enum MenuOptions { PROFILE, CHANGE_PASSWORD, PRIVACY_POLICY, LOGOUT }

// Validator
final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-/])',
      errorText: 'Passwords must have at least one special character')
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: 'Enter a valid email address')
]);

final requiredValidator =
    RequiredValidator(errorText: 'This field is required');

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontWeight: FontWeight.w500),
    ),
    // behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    backgroundColor: accentColor,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
