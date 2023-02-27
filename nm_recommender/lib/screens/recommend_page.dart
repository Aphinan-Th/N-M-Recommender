import 'package:flutter/material.dart';
import 'package:nm_recommender/widgets/staggered_image.dart';
import '../assets/style.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryBg,
        appBar: AppBar(
          title: header("Recommend"),
          elevation: 0,
          backgroundColor: ThemeColor.primaryBg,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: ThemeColor.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const StaggeredView());
  }
}
