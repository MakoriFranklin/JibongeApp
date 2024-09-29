import 'package:flutter/material.dart';

class LawyerCard extends StatelessWidget {
  final String name;
  final String image;
  final String speciality;
  final String number;
  const LawyerCard(
      {super.key,
      required this.name,
      required this.image,
      required this.speciality,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                image,
              ),
              radius: 30,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    speciality,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    number,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
