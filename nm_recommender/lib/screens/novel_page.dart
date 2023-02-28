import 'package:flutter/material.dart';

class NovelPage extends StatefulWidget {
  const NovelPage({super.key});

  @override
  State<NovelPage> createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  @override
  void initState() {
    super.initState();
  }

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
