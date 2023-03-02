import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/screens/recommend_page.dart';

class NextButton extends StatelessWidget {
  final String navigateTo;
  const NextButton({Key? key, required this.navigateTo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const RecommendPage())),
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
