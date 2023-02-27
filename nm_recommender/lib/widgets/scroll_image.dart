import 'package:flutter/material.dart';
import 'package:nm_recommender/widgets/next_button.dart';
import 'package:nm_recommender/widgets/preview_image.dart';

import '../assets/base_url.dart';

class ScrollImage extends StatelessWidget {
  final List<String> urlImage;
  final double width, height;
  final EdgeInsets padding;
  final bool isLoading;
  const ScrollImage(
      {super.key,
      required this.urlImage,
      required this.width,
      required this.height,
      required this.padding,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Row(
                children: List.generate(
                    urlImage.length,
                    (index) => Padding(
                        padding: padding,
                        child: PreviewImage(
                            isLoading: isLoading,
                            urlImage: "${BaseUrl.poster}${urlImage[index]}",
                            width: width,
                            height: height,
                            callBack: () =>
                                Navigator.pushNamed(context, '/detail')))),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 26, right: 50),
                  child: NextButton(navigateTo: '/recommend'))
            ],
          ),
        ),
      ],
    );
  }
}
