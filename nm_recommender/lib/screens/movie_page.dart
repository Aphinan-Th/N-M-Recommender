import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/model/tmdb-model.dart';
import 'package:nm_recommender/screens/recommend_page.dart';
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
  late MovieProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<MovieProvider>(context, listen: false);
    provider.fetchData();
  }

  void onSearch(String value) {
    // Update the state here, outside of the build method
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
    final isLoading = provider.isLoading;
    final popularResults = provider.tmDbPopular?.results;
    final recommendResults = provider.tmDbRecommend?.results;
    final upcomingResults = provider.tmDbUpcoming?.results;
    final topRateResults = provider.tmdbTopRate?.results;
    if (
        popularResults == null ||
        recommendResults == null ||
        upcomingResults == null ||
        topRateResults == null ||
        isLoading) {
      return const Center(child: LoadingScreen());
    }
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SearchField(onSearch: onSearch),
          Consumer<MovieProvider>(
            builder: (context, provider, child) => ScrollType(
              type: List.generate(
                provider.tmDbGenres?.genres.length ?? 0,
                (index) => (provider.tmDbGenres?.genres[index].name ?? ""),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Recommended"),
          ),
          _buildScrollImage(
              recommendResults,
              const EdgeInsets.only(right: 24, left: 24, bottom: 12),
              150,
              200,
              isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),

            child: bold20("Upcoming movie"),

          ),
          _buildScrollImage(upcomingResults,
              const EdgeInsets.only(left: 24, bottom: 12), 75, 100, isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Popular Movies"),
          ),
          _buildScrollImage(popularResults,
              const EdgeInsets.only(left: 24, bottom: 12), 75, 100, isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),

            child: bold20("Top rate movie "),

          ),
          _buildScrollImage(topRateResults,
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
