import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          child: Center(
            child: Text(
              "Login",
              style: GoogleFonts.kanit(
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ),
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
