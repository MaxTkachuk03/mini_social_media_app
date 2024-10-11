import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: hintText,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12.0))),
    );
  }
}
