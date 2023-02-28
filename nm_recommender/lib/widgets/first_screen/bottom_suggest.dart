import 'package:flutter/material.dart';

import '../../assets/style.dart';
import '../../screens/login_page.dart';
import '../button.dart';
import '../navbar.dart';

class ButtonOfSuggestPage extends StatelessWidget {
  const ButtonOfSuggestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Button(
            buttonName: "Login",
            bgColor: ThemeColor.white,
            width: 300,
            height: 40,
            callBack: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            textColor: ThemeColor.black),
        const SizedBox(height: 20),
        Button(
            buttonName: "Continue with guest",
            bgColor: ThemeColor.primary,
            width: 300,
            height: 40,
            callBack: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Navbar()));
            },
            textColor: ThemeColor.white),
      ],
    );
  }
}