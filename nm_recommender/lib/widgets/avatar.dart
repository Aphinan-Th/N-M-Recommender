import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';

class Avatar extends StatefulWidget {
  final String profileImage;
  final double radius;

  const Avatar({Key? key, required this.profileImage, required this.radius})
      : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(
              color: ThemeColor.shadow, offset: Offset(0, 2), blurRadius: 4)
        ]),
        child: CircleAvatar(
          backgroundImage: NetworkImage(widget.profileImage),
          radius: widget.radius,
        ));
  }
}
