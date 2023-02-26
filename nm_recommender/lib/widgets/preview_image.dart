import 'package:flutter/material.dart';
import '../assets/style.dart';

typedef CallBack = void Function();

class PreviewImage extends StatefulWidget {
  final String urlImage;
  final double width, height;
  final CallBack callBack;

  const PreviewImage(
      {Key? key,
      required this.urlImage,
      required this.width,
      required this.height,
      required this.callBack})
      : super(key: key);

  @override
  State<PreviewImage> createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.callBack,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                      color: ThemeColor.shadow,
                      offset: Offset(0, 2),
                      blurRadius: 4)
                ]),
            width: widget.width,
            height: widget.height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: NetworkImage(widget.urlImage),
                fit: BoxFit.cover,
              ),
            )));
  }
}
