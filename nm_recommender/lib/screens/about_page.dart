import 'package:flutter/material.dart';
import 'package:nm_recommender/screens/term_of_use.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: const AboutList(),
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
    return Column(
      children: [
        ListTile(title: const Text("Term of Use",),
          contentPadding: const EdgeInsets.only(left: 30, right: 20),
          trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
          onTap: () =>
          {
            Navigator.push(context,
             MaterialPageRoute(builder: (context) => const TermOfUsePage()))
          },
        ),
        ListTile(title: const Text("Privacy Policy",),
          contentPadding: const EdgeInsets.only(left: 30, right: 20),
          trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
          onTap: () =>
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TermOfUsePage()))
          },
        ),
      ],
    );
  }
}

