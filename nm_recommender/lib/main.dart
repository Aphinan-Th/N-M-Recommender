import 'package:flutter/material.dart';
import 'package:nm_recommender/screens/login_page.dart';
import 'package:nm_recommender/screens/movie_page.dart';
import 'package:nm_recommender/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "N&MRecommender",
      home: SafeArea(
          child: LoginPage(
        key: key,
      )),
    );
  }
}
