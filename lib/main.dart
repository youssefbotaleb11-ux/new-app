import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/feature/views/screen/home_screen.dart';


void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => HomeScreen(),
      },
    );
  }
}