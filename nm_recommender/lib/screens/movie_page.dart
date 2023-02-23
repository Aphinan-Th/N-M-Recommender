import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nm_recommender/assets/style.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Column(
          children: [
            header("Welcome"),
            Text(
              "outfit",
              style: GoogleFonts.outfit(
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            Text(
              "lobster",
              style: GoogleFonts.lobster(
                  textStyle: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ],
        )),
      ],
    );
  }
}
