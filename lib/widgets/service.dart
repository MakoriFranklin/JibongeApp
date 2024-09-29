// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  const Service({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          )
        ],
      ),
      // child: Card(
      //     child: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //   child: Column(
      //     children: [
      //       Icon(icon),
      //       Text(
      //         title,
      //         style: const TextStyle(
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      // ),
    );
  }
}
