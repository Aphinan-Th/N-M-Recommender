import 'package:flutter/material.dart';
import 'package:nm_recommender/screens/searching_screen.dart';
import '../assets/style.dart';
import '../screens/recommend_page.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String> onSearch;
  const SearchField({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    const borderSide = BorderSide(
      color: ThemeColor.gray,
      width: 1.0,
    );
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: borderSide,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 24, right: 24),
      child: TextField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search, color: ThemeColor.secondary),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          fillColor: ThemeColor.white,
        ),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SearchingScreen()));
        },
        onChanged: (value) {
          onSearch(value.toLowerCase());
        },
      ),
    );
  }
}
