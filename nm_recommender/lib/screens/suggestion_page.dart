import 'package:flutter/material.dart';

class SuggestPage extends StatelessWidget {
  const SuggestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TopOfSuggestPage()
          ],
        ),
      ),
    );
  }
}

class TopOfSuggestPage extends StatelessWidget {
  const TopOfSuggestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 30),
          child: const Text("Welcome",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
                fontFamily: "outfit"),
          ),
        ),
        PageInfo(),
      ],
    );
  }
}

class TemplatePage extends StatelessWidget {
  final String image;
  final String sectionName;
  final String description;
  const TemplatePage({Key? key, required this.sectionName, required this.image, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 13),
          child: Image.network(image),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 30),
          child: Text(sectionName,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                fontFamily: "outfit"),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(top: 10, left: 30, right: 40),
          child: Text(description,
            style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                fontFamily: "outfit"),
          ),
        ),
      ],
    );
  }
}

class PageInfo extends StatefulWidget {
  const PageInfo({Key? key}) : super(key: key);

  @override
  State<PageInfo> createState() => _PageInfoState();
}

class _PageInfoState extends State<PageInfo> {
  var pageInfo = {
    1: {
      "image": "https://img.freepik.com/premium-vector/people-airport-terminal-infographics-elements-travel-concept-flat-vector-set_580420-2292.jpg?w=740",
      "sectionName": "Suggestions",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    2: {
      "image": "https://img.freepik.com/premium-vector/people-airport-terminal-infographics-elements-travel-concept-flat-vector-set_580420-2290.jpg?w=740",
      "sectionName": "Favourites",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
    3: {
      "image": "https://img.freepik.com/premium-vector/people-airport-terminal-infographics-elements-travel-concept-flat-vector-set_580420-2300.jpg?w=740",
      "sectionName": "Reviews",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    },
  };

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());
    return Container(
      height: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pageInfo.length,
        itemBuilder: (context, index) {
          return Container(
            width: screenW,
            child: TemplatePage(
              image: pageInfo[index + 1]!["image"]!,
              sectionName: pageInfo[index + 1]!["sectionName"]!,
              description: pageInfo[index + 1]!["description"]!,
            ),
          );
        },
      ),
    );
  }
}
