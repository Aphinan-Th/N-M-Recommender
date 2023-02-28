import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';

class LoadingScreen extends StatefulWidget {
  double? value;
  LoadingScreen({super.key, this.value});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColor.primaryBg,
      child: Center(
        child: CircularProgressIndicator(
          color: ThemeColor.secondary,
          value: widget.value,
        ),
      ),
    );
  }
}
