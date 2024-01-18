import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Icon prefixIcon;
  final String? Function(String?)? validator;
  final bool isPassword;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.validator,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
    );
  }
}
