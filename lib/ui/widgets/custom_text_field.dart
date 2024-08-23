import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.isMultiline});

  final String hintText;
  final bool isMultiline;


  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      maxLines: isMultiline ? null : 1,
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
