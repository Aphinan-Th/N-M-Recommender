import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/widgets/first_screen/slider_page.dart';

import '../widgets/first_screen/bottom_suggest.dart';
import '../widgets/first_screen/suggest_template.dart';

class SuggestPage extends StatefulWidget {
  const SuggestPage({super.key});

  @override
  State<SuggestPage> createState() => _SuggestPageState();
}

class _SuggestPageState extends State<SuggestPage> {
  final PageController _pageController = PageController();
  final Map<int, Map<String, String>> pageInfo = {
    1: {
      "image":
          "https://img.freepik.com/premium-vector/people-airport-terminal-infographics-elements-travel-concept-flat-vector-set_580420-2292.jpg?w=740",
      "sectionName": "Suggestions",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    2: {
      "image":
          "https://img.freepik.com/premium-vector/people-airport-terminal-infographics-elements-travel-concept-flat-vector-set_580420-2290.jpg?w=740",
      "sectionName": "Favourites",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    3: {
      "image":
          "https://img.freepik.com/premium-vector/people-airport-terminal-infographics-elements-travel-concept-flat-vector-set_580420-2300.jpg?w=740",
      "sectionName": "Reviews",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
  };

  _image(index) => pageInfo[index + 1]?["image"]!;
  _sectionName(index) => pageInfo[index + 1]?["sectionName"]!;
  _description(index) => pageInfo[index + 1]?["description"]!;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildTemplatePage(int index) {
    return Padding(
        padding: const EdgeInsets.only(top: 65),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TemplatePage(
            image: _image(index)!,
            sectionName: _sectionName(index)!,
            description: _description(index)!,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
                child: Container(
                    color: ThemeColor.white,
                    child: Stack(children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 30, top: 24),
                        child: title("Welcome"),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: PageView(
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildTemplatePage(0),
                            _buildTemplatePage(1),
                            _buildTemplatePage(2),
                          ],
                        ),
                      ),
                      Positioned(
                          top: screenH * 0.75,
                          left: screenW * 0.5 - 40,
                          child: SliderPage(controller: _pageController)),
                      Positioned(
                          top: screenH * 0.8,
                          left: screenW * 0.5 - 150,
                          child: const ButtonOfSuggestPage())
                    ])))));
  }
}
