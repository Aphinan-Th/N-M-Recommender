import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/model/tmdb-model.dart';
import 'package:nm_recommender/widgets/loading.dart';
import 'package:nm_recommender/widgets/scroll_image.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';
import '../widgets/scroll_type.dart';
import '../widgets/search_field.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late Provider<MovieProvider> provider;
  void onSearch(String value) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<MovieProvider>(context, listen: false);
    provider.fetchData();
    provider.fetchGenre();
  }

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
          SearchField(onSearch: (value) {
            setState(() {});
          }),
          Consumer<MovieProvider>(
            builder: (context, provider, child) => ScrollType(
              type: List.generate(
                genres.length,
                (index) => genres[index].name,
              ),
              callBack: () => Navigator.pushNamed(context, '/recommend'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Recommend"),
          ),
          _buildScrollImage(
              popularResults,
              const EdgeInsets.only(right: 24, left: 24, bottom: 12),
              150,
              200,
              isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Top movie"),
          ),
          _buildScrollImage(popularResults,
              const EdgeInsets.only(left: 24, bottom: 12), 75, 100, isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Top movie"),
          ),
          _buildScrollImage(popularResults,
              const EdgeInsets.only(left: 24, bottom: 12), 75, 100, isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Top movie"),
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
