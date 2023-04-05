import 'package:flutter/material.dart';

class TemplatePage extends StatelessWidget {
  final String image;
  final String sectionName;
  final String description;
  const TemplatePage(
      {Key? key,
      required this.sectionName,
      required this.image,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(2.0),
          width: 350,
          height: 350,
          child: Image.network(image),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 30),
          child: Text(
            sectionName,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                fontFamily: "outfit"),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(top: 10, left: 30, right: 40),
          child: Text(
            description,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 19,
                fontFamily: "outfit"),
          ),
        ),
      ],
    );
  }
}
