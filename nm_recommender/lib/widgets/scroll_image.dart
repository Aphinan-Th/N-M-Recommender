import 'package:flutter/material.dart';
import 'package:nm_recommender/widgets/next_button.dart';
import 'package:nm_recommender/widgets/preview_image.dart';

import '../assets/base_url.dart';

class ScrollImage extends StatelessWidget {
  final List<String> urlImage;
  const ScrollImage({super.key, required this.urlImage});

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
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: PreviewImage(
                            urlImage: "${BaseUrl.poster}${urlImage[index]}",
                            width: 150,
                            height: 200,
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
