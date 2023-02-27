import 'package:flutter/material.dart';

import '../assets/style.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String> onSearch;
  const SearchField({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(20);
    BorderSide borderSide = const BorderSide(
      color: ThemeColor.gray,
      width: 1.0,
    );
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
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
              prefixIcon: const Icon(Icons.search),
              border: outlineInputBorder,
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              prefixIconColor: ThemeColor.primary,
              fillColor: ThemeColor.white),
          onChanged: (value) {
            onSearch(value.toLowerCase());
          },
        ));
  }
}
