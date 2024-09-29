import 'package:flutter/material.dart';

class Updates extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const Updates(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        width: 40,
        height: 35,
      ),
      title: Text(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.orange,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        subtitle,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
