import 'package:flutter/material.dart';
import 'package:foma/utils/colors.dart';
import 'package:foma/utils/lawyersList.dart';
import 'package:foma/widgets/Lawyer_Card.dart';

class Lawyerspage extends StatelessWidget {
  const Lawyerspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        title: const Text(
          'Lawyers',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: Lawyerslist.list.length,
          itemBuilder: (context, index) {
            final listItem = Lawyerslist.list[index];
            return LawyerCard(
                name: listItem['name'] as String,
                image: listItem['image'] as String,
                speciality: listItem['specialty'] as String,
                number: listItem['phone'] as String);
          },
        ),
      ),
    );
  }
}
