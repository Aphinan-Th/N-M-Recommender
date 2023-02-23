import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/widgets/button.dart';

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
        Button(
          textColor: Colors.white,
          bgColor: primary,
          buttonName: 'Continue with guest',
          callBack: () => Navigator.pop(context),
          width: 300,
          height: 50,
        ),
        // Expanded(
        //     child: Container(
        //   height: 100,
        //   color: Colors.green,
        // )
        // ),
      ],
    );
  }
}
