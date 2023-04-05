import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/model/tmdb-model.dart';
import 'package:nm_recommender/providers/movie_provider.dart';
import 'package:nm_recommender/screens/recommend_page.dart';
import 'package:nm_recommender/widgets/button.dart';
import 'package:provider/provider.dart';

typedef ChangeCallback = void Function(double rating);

class NonScrollType extends StatelessWidget {
  final List<String> type;
  const NonScrollType({Key? key, required this.type}) : super(key: key);

  List<Widget> _a() {
    return List.generate(
        type.length,
        (index) => Padding(
            padding: const EdgeInsets.all(10),
            child: Consumer<MovieProvider>(
              builder: (context, value, child) {
                return Button(
                  buttonName: type[index],
                  bgColor: ThemeColor.primary,
                  height: 30,
                  callBack: () {
                    print("asdd");
                    final Genre? genre = value.tmDbGenres?.genres.firstWhere(
                        (e) => e.name == type[index],
                        orElse: () => Genre(id: 0, name: ""));
                    value.setGenreId(genre?.id as int);
                    value.updateMovieByGenre();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const RecommendPage()),
                    );
                  },
                  textColor: ThemeColor.white,
                  width: type[index].length <= 4
                      ? type[index].length * 20.0
                      : type[index].length * 15,
                  textWithStyle: bold16(type[index]),
                );
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      child: Wrap(
        children: [..._a()],
      ),
    );
  }
}
