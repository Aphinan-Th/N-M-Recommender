import 'package:flutter/material.dart';
import 'package:nm_recommender/widgets/avatar.dart';

class NovelPage extends StatefulWidget {
  const NovelPage({super.key});

  @override
  State<NovelPage> createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          height: 100,
          color: Colors.red,
        )),
      ],
    );
  }
}
