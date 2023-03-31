import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';

class LoadingScreen extends StatelessWidget {
  final double? value;
  const LoadingScreen({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColor.primaryBg,
      child: Center(
        child: CircularProgressIndicator(
          color: ThemeColor.secondary,
          value: value,
        ),
      ),
    );
  }
}
