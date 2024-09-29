import 'package:flutter/material.dart';
import 'package:foma/utils/colors.dart';
import 'package:foma/utils/news.dart';
import 'package:foma/widgets/carousel.dart';
import 'package:foma/widgets/service.dart';
import 'package:foma/widgets/updates.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    const double width = 20;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/strong.jpeg'),
            )),
        title: const Text(
          'Jibonge',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: AppColors.appBarColor,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: .0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Trending Now',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontSize: 20),
              ),
            ),
            const SizedBox(height: 5),
            Carousel(),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Explore',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Service(
                    title: 'Research',
                    color: Colors.blue,
                    icon: Icons.search,
                    onTap: () {
                      Navigator.pushNamed(context, '/chatBot');
                    },
                  ),
                  const SizedBox(
                    width: width,
                  ),
                  Service(
                    title: 'Updates',
                    icon: Icons.newspaper,
                    color: Colors.teal,
                    onTap: () {
                      Navigator.pushNamed(context, '/news');
                    },
                  ),
                  const SizedBox(
                    width: width,
                  ),
                  Service(
                    title: 'Lawyers',
                    icon: Icons.book,
                    color: Colors.purple,
                    onTap: () {
                      Navigator.pushNamed(context, '/lawyers');
                    },
                  ),
                  const SizedBox(
                    width: width,
                  ),
                  Service(
                    title: 'Report',
                    icon: Icons.report,
                    color: Colors.amber,
                    onTap: () {
                      Navigator.pushNamed(context, '/report');
                    },
                  ),
                  const SizedBox(
                    width: width,
                  ),
                  Service(
                    title: 'Emergency',
                    color: Colors.red,
                    icon: Icons.emergency,
                    onTap: () {
                      Navigator.pushNamed(context, '/emergency');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Latest Updates',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: News.news.length,
                    itemBuilder: (context, index) {
                      final newsItem = News.news[index];
                      return Updates(
                        image: newsItem['image'] as String,
                        title: newsItem['title'] as String,
                        subtitle: newsItem['subtitle'] as String,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
