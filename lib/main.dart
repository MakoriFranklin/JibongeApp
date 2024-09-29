import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:foma/pages/chat_bot_page.dart';
import 'package:foma/pages/emergency.dart';
import 'package:foma/pages/homePage.dart';
import 'package:foma/pages/lawyersPage.dart';
import 'package:foma/pages/newsPage.dart';
import 'package:foma/pages/reportPage.dart';
import 'package:foma/pages/reportSuccessPage.dart';
import 'package:foma/pages/splash_screen.dart';
import 'package:foma/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Foma ChatBot',
        // theme: ThemeData.light(useMaterial3: true).copyWith(
        //     scaffoldBackgroundColor: AppColors.whiteColor,
        //     appBarTheme: AppBarTheme(backgroundColor: AppColors.whiteColor)
        // ),
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255),
          ),
        ).copyWith(
            scaffoldBackgroundColor: AppColors.appBackgroundColor,
            textTheme: TextTheme(),
            appBarTheme: AppBarTheme(
                color: Colors.white,
                iconTheme: IconThemeData(color: Colors.white))),
        debugShowCheckedModeBanner: false,
        // initialRoute: '/',
        routes: {
          // '/': (context) => const Homepage(),
          '/chatBot': (context) => const ChatBotPage(),
          '/news': (context) => const Newspage(),
          '/lawyers': (context) => const Lawyerspage(),
          '/emergency': (context) => const Emergency(),
          '/report': (context) => const Reportpage(),
          '/reportSuccess': (context) => const Reportsuccesspage(),
        },
        home: AnimatedSplashScreen(
          backgroundColor: AppColors.appBackgroundColor,
          splash: SplashScreen(),
          nextScreen: Homepage(),
          // splashTransition: SplashTransition.rotationTransition,
          // pageTransitionType: pageTransitionType.scale,
        ));
  }
}
