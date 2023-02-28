import 'package:flutter/material.dart';
import 'package:nm_recommender/providers/movie_provider.dart';
import 'package:nm_recommender/screens/login_page.dart';
import 'package:nm_recommender/screens/recommend_page.dart';
import 'package:nm_recommender/screens/suggestion_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MovieProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "N&MRecommender",
          initialRoute: '/start_screen',
          routes: {
            '/start_screen':(context) => const SuggestPage(),
            '/login': (context) => const LoginPage(),
            '/recommend': (context) => const RecommendPage(),
            '/detail': (context) => Container()
          },
          home: SafeArea(
              child: LoginPage(
            key: key,
          )),
        ));
  }
}
