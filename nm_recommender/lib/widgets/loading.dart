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
      // color: ThemeColor.white,
      child: Center(
        child: CircularProgressIndicator(
          color: ThemeColor.primary,
          value: widget.value,
        ),
      ),
    );
  }
}
