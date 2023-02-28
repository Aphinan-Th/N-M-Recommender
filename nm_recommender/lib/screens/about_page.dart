import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Page"),
      ),
      body: AboutList(),
    );
  }
}

class AboutList extends StatefulWidget {
  const AboutList({Key? key}) : super(key: key);

  @override
  State<AboutList> createState() => _AboutListState();
}

class _AboutListState extends State<AboutList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

