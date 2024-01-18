import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        prefixIcon: Icon(Icons.email,color: Colors.grey.shade400),
      ),
    );
  }
}
