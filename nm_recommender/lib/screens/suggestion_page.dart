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
  var pageInfo = {
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
  image(index) => pageInfo[index + 1]?["image"]!;
  sectionName(index) => pageInfo[index + 1]?["sectionName"]!;
  description(index) => pageInfo[index + 1]?["description"]!;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
                        child: const Text(
                          "Welcome",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              fontFamily: "outfit"),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                        child: PageView(
                          controller: _pageController,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 65),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: TemplatePage(
                                  image: image(0)!,
                                  sectionName: sectionName(0)!,
                                  description: description(0)!,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 65),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: TemplatePage(
                                  image: image(1)!,
                                  sectionName: sectionName(1)!,
                                  description: description(1)!,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 65),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: TemplatePage(
                                  image: image(2)!,
                                  sectionName: sectionName(2)!,
                                  description: description(2)!,
                                ),
                              ),
                            ),
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

// class SuggestPage extends StatelessWidget {
//   const SuggestPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: const [TopOfSuggestPage(), ButtonOfSuggestPage()],
//       ),
//     );
//   }
// }

// class TopOfSuggestPage extends StatelessWidget {
//   const TopOfSuggestPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           alignment: Alignment.topLeft,
//           margin: const EdgeInsets.only(left: 30),
//           child: const Text(
//             "Welcome",
//             style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 30,
//                 fontFamily: "outfit"),
//           ),
//         ),
//         const PageInfo(),
//       ],
//     );
//   }
// }

// class PageInfo extends StatefulWidget {
//   const PageInfo({Key? key}) : super(key: key);

//   @override
//   State<PageInfo> createState() => _PageInfoState();
// }

// class _PageInfoState extends State<PageInfo> {
//   var pageInfo = {
//     1: {
//       "image":
//           "https://img.freepik.com/premium-vector/people-airport-terminal-infographics-elements-travel-concept-flat-vector-set_580420-2292.jpg?w=740",
//       "sectionName": "Suggestions",
//       "description":
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//     },
//     2: {
//       "image":
//           "https://img.freepik.com/premium-vector/people-airport-terminal-infographics-elements-travel-concept-flat-vector-set_580420-2290.jpg?w=740",
//       "sectionName": "Favourites",
//       "description":
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//     },
//     3: {
//       "image":
//           "https://img.freepik.com/premium-vector/people-airport-terminal-infographics-elements-travel-concept-flat-vector-set_580420-2300.jpg?w=740",
//       "sectionName": "Reviews",
//       "description":
//           "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
//     },
//   };

//   @override
//   Widget build(BuildContext context) {
//     final screenW = MediaQuery.of(context).size.width;
//     debugPrint(screenW.toString());
//     return SizedBox(
//       height: 500,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: pageInfo.length,
//         itemBuilder: (context, index) {
//           return SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: TemplatePage(
//               image: pageInfo[index + 1]!["image"]!,
//               sectionName: pageInfo[index + 1]!["sectionName"]!,
//               description: pageInfo[index + 1]!["description"]!,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }