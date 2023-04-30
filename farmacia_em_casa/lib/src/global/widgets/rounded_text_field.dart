
import 'package:flutter/material.dart';

class RoundedTextFieldWidget extends StatelessWidget {
  const RoundedTextFieldWidget({
    super.key,
    required this.labelText,
    this.controller,
    this.validator,
    this.obscure = false,
    this.textAlign = TextAlign.start
  });

  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscure;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign,
      validator: validator,
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
