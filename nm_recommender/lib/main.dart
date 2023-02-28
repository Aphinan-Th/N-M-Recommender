import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/screens/login_page.dart';
import 'package:nm_recommender/screens/sign_up.dart';

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
          child: SignUp(
        key: key,
      )),
    );
  }
}
