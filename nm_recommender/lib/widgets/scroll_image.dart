import 'package:flutter/material.dart';
import 'package:nm_recommender/widgets/next_button.dart';
import 'package:nm_recommender/widgets/preview_image.dart';

import '../assets/base_url.dart';

class ScrollImage extends StatelessWidget {
  final List<String> urlImage;
  final double width, height;
  final EdgeInsets padding;
  final bool isLoading;

  const ScrollImage({
    Key? key,
    required this.urlImage,
    required this.width,
    required this.height,
    required this.padding,
    required this.isLoading,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final length = urlImage.length;
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: length + 1,
        itemBuilder: (context, index) {
          if (index == length) {
            return const Padding(
                padding: EdgeInsets.only(left: 26, right: 26),
                child: NextButton(navigateTo: '/recommend'));
          }
          return Padding(
            padding: padding,
            child: PreviewImage(
              isLoading: isLoading,
              urlImage: "${BaseUrl.poster}${urlImage[index]}",
              width: width,
              height: height,
              callBack: () => Navigator.pushNamed(context, '/detail'),
            ),
          );
        },
      ),
    );
  }
}
