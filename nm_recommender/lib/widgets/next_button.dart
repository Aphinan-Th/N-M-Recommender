import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';

class NextButton extends StatelessWidget {
  final String navigateTo;
  const NextButton({super.key, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, navigateTo),
      child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ThemeColor.white,
              boxShadow: [
                BoxShadow(
                    color: ThemeColor.shadow,
                    offset: Offset(0, 2),
                    blurRadius: 4)
              ]),
          child: const Icon(
            Icons.arrow_right_alt_sharp,
            color: ThemeColor.black,
          )),
    );
  }
}
