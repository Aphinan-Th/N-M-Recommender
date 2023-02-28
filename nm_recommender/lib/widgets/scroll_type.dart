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
    return Column(
      children: [
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 24,
                ),
                Row(
                  children: List.generate(
                    type.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Button(
                        buttonName: type[index],
                        bgColor: ThemeColor.primary,
                        height: 30,
                        callBack: callBack,
                        textColor: ThemeColor.white,
                        width: null,
                        textWithStyle: bold16(type[index]),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }
}
