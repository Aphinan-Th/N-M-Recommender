import 'package:flutter/material.dart';
import 'package:nm_recommender/providers/movie_provider.dart';
import 'package:nm_recommender/widgets/staggered_image.dart';
import 'package:provider/provider.dart';
import '../assets/style.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryBg,
        appBar: AppBar(
          title: header("Recommend"),
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
        body: Consumer<MovieProvider>(builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                  child: StaggeredView(
                tmdbMovieGenre: value.tmdbMovieGenre,
                isLoading: value.isLoading,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColor.primary),
                    child: const Icon(Icons.chevron_left_sharp),
                    onPressed: () {
                      setState(() {
                        value.reduceGenrePage();
                      });
                    },
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: buttonBlack(
                          "${value.movieGenrePage} form ${value.tmdbMovieGenre?.totalPages}")),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeColor.primary),
                    child: const Icon(Icons.chevron_right_sharp),
                    onPressed: () {
                      setState(() {
                        value.increaseGenrePage();
                      });
                    },
                  )
                ],
              )
            ],
          );
        }));
  }
}
