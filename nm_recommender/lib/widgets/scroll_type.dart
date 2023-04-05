import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/model/tmdb-model.dart';
import 'package:nm_recommender/providers/movie_provider.dart';
import 'package:nm_recommender/screens/recommend_page.dart';
import 'package:nm_recommender/widgets/button.dart';
import 'package:provider/provider.dart';

typedef ChangeCallback = void Function(double rating);

class ScrollType extends StatelessWidget {
  final List<String> type;
  const ScrollType({Key? key, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: type.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Consumer<MovieProvider>(
                builder: (context, value, child) {
                  return Button(
                    buttonName: type[index],
                    bgColor: ThemeColor.primary,
                    height: 30,
                    callBack: () {
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
                    width: null,
                    textWithStyle: bold16(type[index]),
                  );
                },
              ));
        },
      ),
    );
  }
}
