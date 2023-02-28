import 'package:flutter/material.dart';

class ThemeColor {
  static const primary = Color(0xff4B39EF);
  static const secondary = Color(0xff39D2C0);
  static const primaryBg = Color(0xffF1F4F8);
  static const alternate = Color(0xffFF5963);
  static const black = Color(0xff0f1113);
  static const gray = Color(0xff57636c);
  static const white = Color(0xffffffff);
  static const shadow = Color(0x33000000);
}

class ThemeText {
  static TextStyle bw60032 = const TextStyle(
      fontSize: 32, fontWeight: FontWeight.w600, color: ThemeColor.black);
  static TextStyle bw50024 = const TextStyle(
      fontSize: 24, fontWeight: FontWeight.w500, color: ThemeColor.black);
  static TextStyle gw40014 = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: ThemeColor.gray);
  static TextStyle bw40016 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: ThemeColor.black);
  static TextStyle ww40016 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: ThemeColor.white);
  static TextStyle ww60016 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: ThemeColor.white);
  static TextStyle bw60020 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: ThemeColor.black);
}

Widget title(text) => Text(text, style: ThemeText.bw60032);
Widget header(text) => Text(text, style: ThemeText.bw50024);
Widget body(text) => Text(text, style: ThemeText.gw40014);
Widget buttonBlack(text) => Text(text, style: ThemeText.bw40016);
Widget buttonWhite(text) => Text(text, style: ThemeText.ww40016);
Widget bold16(text) => Text(text, style: ThemeText.ww60016);
Widget bold20(text) => Text(text, style: ThemeText.bw60020);
