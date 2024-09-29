// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnswersBox extends StatelessWidget {
  final String generatedResult;
  const AnswersBox({
    Key? key,
    required this.generatedResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          generatedResult == ''
              ? 'Welcome back. How can i help you today?'
              : generatedResult,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: generatedResult == '' ? 25 : 14,
              fontFamily: 'Roboto'),
        ),
      ),
    );
  }
}
