import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/providers/movie_provider.dart';
import 'package:nm_recommender/widgets/list_type.dart';
import 'package:provider/provider.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({super.key});

  @override
  State<SearchingScreen> createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {
  void onSearch(String value) {
    // Update the state here, outside of the build method
    setState(() {});
  }

  Widget _searchField() {
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
        onChanged: (value) {
          onSearch(value.toLowerCase());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryBg,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ThemeColor.primaryBg,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: ThemeColor.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchField(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: header("Genre"),
            ),
            Wrap(
              children: [
                Consumer<MovieProvider>(
                  builder: (context, provider, child) => NonScrollType(
                    type: List.generate(
                      provider.tmDbGenres?.genres.length ?? 0,
                      (index) =>
                          (provider.tmDbGenres?.genres[index].name ?? ""),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: header("History"),
            ),
            Wrap(
              children: [
                Consumer<MovieProvider>(
                  builder: (context, provider, child) => NonScrollType(
                    type: List.generate(
                      provider.tmDbGenres?.genres.length ?? 0,
                      (index) =>
                          (provider.tmDbGenres?.genres[index].name ?? ""),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )));
  }
}
