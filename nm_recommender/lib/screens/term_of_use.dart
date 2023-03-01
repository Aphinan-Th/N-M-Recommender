import 'package:flutter/material.dart';

class TermOfUsePage extends StatelessWidget {
  const TermOfUsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Term of Use",),
      ),
      body: Container(
        child: dataTerm(),
      )
    );
  }
}

class dataTerm extends StatelessWidget {
  const dataTerm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(40),
          child: Text("This project is created by the students of the Khon Kaen University "
                      "for the course Mobile Application Development. The project is a mobile application "
                      "that recommends movies and novels to the user based on their preferences. "
                      "The project is created using Flutter and Dart.")
        ),
      ],
    );
  }
}
