import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderPage extends StatelessWidget {
  final PageController controller;
  const SliderPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 1),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
        child: SmoothPageIndicator(
          controller: controller,
          count: 3,
          axisDirection: Axis.horizontal,
          onDotClicked: (i) {
            controller.animateToPage(
              i,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          effect: const ExpandingDotsEffect(
            expansionFactor: 2,
            spacing: 8,
            radius: 16,
            dotWidth: 16,
            dotHeight: 4,
            dotColor: Color(0xFFE0E3E7),
            activeDotColor: Color(0xFF0F1113),
            paintStyle: PaintingStyle.fill,
          ),
        ),
      ),
    );
  }
}
