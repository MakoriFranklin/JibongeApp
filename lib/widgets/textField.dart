// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final TextEditingController controller;
  const Textfield({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: null,
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Enter Prompt',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
