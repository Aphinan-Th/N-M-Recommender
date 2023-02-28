import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';

class Button extends StatefulWidget {
  final String buttonName;
  final Color bgColor, textColor;
  final double? width;
  final double height;
  final VoidCallback callBack;
  Widget? textWithStyle;
  Button(
      {Key? key,
      required this.buttonName,
      required this.bgColor,
      required this.width,
      required this.height,
      required this.callBack,
      required this.textColor,
      this.textWithStyle})
      : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callBack,
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                  color: ThemeColor.shadow, blurRadius: 4, offset: Offset(0, 2))
            ]),
        child: Center(
          child: widget.textWithStyle ??
              Text(widget.buttonName,
                  style: TextStyle(
                      color: widget.textColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
