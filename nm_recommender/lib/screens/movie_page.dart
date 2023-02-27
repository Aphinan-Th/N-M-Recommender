import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/widgets/scroll_image.dart';
import 'package:provider/provider.dart';

import '../model/tmdb-model.dart';
import '../providers/movie_provider.dart';
import '../services/api-service.dart';
import '../widgets/scroll-type.dart';
import '../widgets/search_field.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  List<String> items = ['apple', 'banana', 'cherry', 'grape', 'orange', 'pear'];
  List<String> filteredItems = [];

  void onSearch(String value) {
    setState(() {
      filteredItems = items.where((item) => item.startsWith(value)).toList();
    });
  }

  var type = [
    "aaaaaa",
    "b",
    "c",
    "aaaaaa",
    "b",
    "aaaaaa",
    "b",
    "aaaaaa",
    "b",
    "aaaaaa",
    "b",
    "aaaaaa",
    "b",
    "aaaaaa",
    "b",
  ];
  var callBack = [
    () {},
    () {},
    () {},
  ];

  var urlImage = [
    "https://image.tmdb.org/t/p/original/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
    "https://image.tmdb.org/t/p/original/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
    "https://image.tmdb.org/t/p/original/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg"
  ];
  
  final Widget _consumer = Consumer(
    builder: (context, MovieProvider provider, child) {
      provider.fetchData();
      return ScrollImage(
        urlImage: List.generate(provider.tmDbPopular.results.length,
            (index) => provider.tmDbPopular.results[index].backdropPath),
      );
    },
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchField(items: items, onSearch: onSearch),
        ScrollType(type: type, callBack: callBack),
        Padding(
            padding: const EdgeInsets.only(top: 12, left: 24, bottom: 12),
            child: bold20("Recommend")),
        _consumer,
      ],
    );
  }
}
