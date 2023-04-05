import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../assets/style.dart';
import '../model/tmdb-model.dart';
import '../providers/movie_provider.dart';
import '../widgets/loading.dart';
import '../widgets/scroll_image.dart';
import '../widgets/scroll_type.dart';
import '../widgets/search_field.dart';

class NovelPage extends StatefulWidget {
  const NovelPage({super.key});

  @override
  State<NovelPage> createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context);
    final isLoading = provider.isLoading;
    final genres = provider.tmDbGenres?.genres;
    final popularResults = provider.tmDbPopular?.results;
    if (genres == null || popularResults == null || isLoading) {
      return const Center(child: LoadingScreen());
    }
    final List genreNovel = [
      'Romance',
      'Mystery',
      'Science Fiction',
      'Fantasy',
      'Thriller',
      'Suspense',
      'Historical'
    ];
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SearchField(onSearch: (value) {
            setState(() {});
          }),
          Consumer<MovieProvider>(
            builder: (context, provider, child) => ScrollType(
              type: List.generate(
                genreNovel.length,
                (index) => genreNovel[index],
              ),
              // callBack: () => Navigator.pushNamed(context, '/recommend'),
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
            child: bold20("Top Novels"),
          ),
          _buildScrollImage(popularResults,
              const EdgeInsets.only(left: 24, bottom: 12), 75, 100, isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Romance"),
          ),
          _buildScrollImage(popularResults,
              const EdgeInsets.only(left: 24, bottom: 12), 75, 100, isLoading),
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Children's literature"),
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
