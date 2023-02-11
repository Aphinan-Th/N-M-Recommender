import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/screens/movie_page.dart';
import 'package:nm_recommender/widgets/navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          body: Center(
        child: Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text("Login", style: TextStyle(fontSize: 20),),
          ),
        ),
      )),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Navbar()));
      },
    );
  }
}
