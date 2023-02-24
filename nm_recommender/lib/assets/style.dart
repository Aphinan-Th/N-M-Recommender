import 'package:flutter/material.dart';
class ThemeColor {
  static const primary = Color(0xff4B39EF);
  static const secondary = Color(0xff39D2C0);
  static const primaryBg = Color(0xffF1F4F8);
  static const alternate = Color(0xffFF5963);
  static const black = Color(0xff0f1113);
  static const gray = Color(0xff57636c);
  static const white = Color(0xffffffff);
}

class ThemeText {
  static TextStyle titleMedium = const TextStyle(
      fontSize: 32, fontWeight: FontWeight.w600, color: ThemeColor.black);
  static TextStyle titleSmall = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w500, color: ThemeColor.black);
  static TextStyle bodyText2 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: ThemeColor.gray);
  static TextStyle subtitle2 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: ThemeColor.black);
  static TextStyle subtitle3 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: ThemeColor.white);
}

Widget title(text) => Text(text, style: ThemeText.titleMedium);
Widget header(text) => Text(text, style: ThemeText.titleSmall);
Widget body(text) => Text(text, style: ThemeText.bodyText2);
Widget buttonBlack(text) => Text(text, style: ThemeText.subtitle2);
Widget buttonWhite(text) => Text(text, style: ThemeText.subtitle3);
