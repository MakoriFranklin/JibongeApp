import 'package:flutter/material.dart';
import 'package:foma/utils/colors.dart';
import 'package:foma/utils/news.dart';
import 'package:foma/widgets/updates.dart';

class Newspage extends StatelessWidget {
  const Newspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text(
          'Latest News',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: ListView.builder(
        itemCount: News.news.length,
        itemBuilder: (context, index) {
          final newsItem = News.news[index];
          return Updates(
            image: newsItem['image'] as String,
            title: newsItem['title'] as String,
            subtitle: newsItem['subtitle'] as String,
          );
        },
      ),
    );
  }
}
