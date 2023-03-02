import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/widgets/button.dart';

class ScrollType extends StatelessWidget {
  final List<String> type;
  final VoidCallback callBack;

  const ScrollType({Key? key, required this.type, required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: type.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Button(
              buttonName: type[index],
              bgColor: ThemeColor.primary,
              height: 30,
              callBack: callBack,
              textColor: ThemeColor.white,
              width: null,
              textWithStyle: bold16(type[index]),
            ),
          );
        },
      ),
    );
  }
}
