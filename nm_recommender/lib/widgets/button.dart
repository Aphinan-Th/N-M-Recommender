import 'package:flutter/material.dart';

typedef CallBack = void Function();

class Button extends StatefulWidget {
  final String buttonName;
  final Color bgColor, textColor;
  final double width, height;
  final CallBack callBack;
  const Button(
      {Key? key,
      required this.buttonName,
      required this.bgColor,
      required this.width,
      required this.height,
      required this.callBack,
      required this.textColor})
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
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: widget.bgColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54, blurRadius: 1.5, spreadRadius: 1.1)
            ]),
        child: Center(
          child: Text(widget.buttonName,
              style: TextStyle(
                  color: widget.textColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
