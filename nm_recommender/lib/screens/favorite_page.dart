import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:provider/provider.dart';

import '../model/tmdb-model.dart';
import '../providers/movie_provider.dart';
import '../widgets/loading.dart';
import '../widgets/scroll_image.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late MovieProvider provider;
  void onSearch(String value) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    provider = Provider.of<MovieProvider>(context, listen: false);
    provider.fetchData();
  }

  late String dropdowns = 'Movies';
  var items = ['Movies', 'Novels'];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
    final isLoading = provider.isLoading;
    final genres = provider.tmDbGenres?.genres;
    final popularResults = provider.tmDbPopular?.results;
    if (genres == null || popularResults == null || isLoading) {
      return Center(child: LoadingScreen());
    }
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              margin: const EdgeInsets.only(right: 12.0),
              padding: const EdgeInsets.only(left: 12.0),
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: ThemeColor.white),
              child: DropdownButton(
                borderRadius: BorderRadius.circular(20.0),
                value: dropdowns,
                icon: const Icon(Icons.arrow_drop_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdowns = newValue!;
                  });
                },
                dropdownColor: ThemeColor.white,
                focusColor: ThemeColor.white,
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Sci-Fi"),
          ),
          _buildScrollImage(popularResults,
              const EdgeInsets.only(left: 24, bottom: 12), 75, 100, isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Action"),
          ),
          _buildScrollImage(popularResults,
              const EdgeInsets.only(left: 24, bottom: 12), 75, 100, isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Comedy"),
          ),
          _buildScrollImage(popularResults,
              const EdgeInsets.only(left: 24, bottom: 12), 75, 100, isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Horror"),
          ),
          _buildScrollImage(popularResults,
              const EdgeInsets.only(left: 24, bottom: 12), 75, 100, isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Animation"),
          ),
          _buildScrollImage(popularResults,
              const EdgeInsets.only(left: 24, bottom: 12), 75, 100, isLoading),
        ]));
  }
}

Widget _buildScrollImage(List<Result> results, EdgeInsets padding, double width,
    double height, bool isLoading) {
  return ScrollImage(
    isLoading: isLoading,
    padding: padding,
    width: width,
    height: height,
    urlImage: List.generate(
      results.length,
      (index) => results[index].posterPath,
    ),
  );
}
