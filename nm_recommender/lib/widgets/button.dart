import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';

class Button extends StatelessWidget {
  final String buttonName;
  final Color bgColor;
  final double? width;
  final double height;
  final VoidCallback callBack;
  final Color textColor;
  final Widget? textWithStyle;
  final NetworkImage? icon;

  const Button({
    Key? key,
    required this.buttonName,
    required this.bgColor,
    this.width,
    required this.height,
    required this.callBack,
    required this.textColor,
    this.textWithStyle,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: ThemeColor.shadow,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.g_mobiledata),
              ),
            textWithStyle ??
                Text(
                  buttonName,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
