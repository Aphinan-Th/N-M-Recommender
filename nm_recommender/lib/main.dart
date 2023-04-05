import 'package:flutter/material.dart';
import 'package:nm_recommender/providers/auth_provider.dart';
import 'package:nm_recommender/providers/movie_provider.dart';
import 'package:nm_recommender/screens/login_page.dart';
import 'package:nm_recommender/screens/recommend_page.dart';
import 'package:nm_recommender/screens/suggestion_page.dart';
import 'package:nm_recommender/widgets/navbar.dart';
import 'package:provider/provider.dart';
import 'screens/detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MovieProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "N&MRecommender",
          initialRoute: '/start_screen',
          routes: {
            '/start_screen': (context) => const SuggestPage(),
            '/login': (context) => const LoginPage(),
            '/recommend': (context) => const RecommendPage(),
            '/detail': (context) => Container(),
            '/navbar': (context) => const Navbar(),
            '/detail': (context) => const DetailPage()
          },
          home: SafeArea(
              child: LoginPage(
            key: key,
          )),
        ));
  }
}
