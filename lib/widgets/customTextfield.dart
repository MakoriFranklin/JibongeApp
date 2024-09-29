import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  final String hintText;
  final String helperText;
  final int maxLines;
  const Customtextfield(
      {super.key,
      required this.hintText,
      required this.helperText,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          helperText: helperText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
