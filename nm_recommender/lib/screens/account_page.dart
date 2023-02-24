import 'package:flutter/material.dart';
import 'package:nm_recommender/widgets/button.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          height: 100,
          color: Colors.blue,
        )),
      ],
    );
  }
}
