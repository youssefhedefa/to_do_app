import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.isMultiline, required this.controller, required this.validatorText});

  final String hintText;
  final bool isMultiline;
  final TextEditingController controller;
  final String validatorText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      maxLines: isMultiline ? null : 1,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your note $validatorText';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
      borderSide: BorderSide(
        color: Colors.white,
      ),
    );
  }

}
