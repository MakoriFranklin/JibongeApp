import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/news1.jpg',
    'assets/images/news2.jpg',
    'assets/images/news3.jpg',
    'assets/images/news4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
      items: imgList
          .map((item) => Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
                ),
              ))
          .toList(),
    );
  }
}
