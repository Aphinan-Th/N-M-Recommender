import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nm_recommender/assets/base_url.dart';
import 'package:nm_recommender/providers/movie_provider.dart';
import 'package:provider/provider.dart';

import '../assets/style.dart';
import '../widgets/preview_image.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  final Widget _consumer = Consumer(
    builder: (context, MovieProvider provider, child) {
      provider.fetchData();
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: provider.tmDbPopular.results.length,
          itemBuilder: (BuildContext context, int index) => Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                      color: ThemeColor.shadow,
                      offset: Offset(0, 2),
                      blurRadius: 4)
                ],
              ),
              child: PreviewImage(
                  urlImage:
                      "${BaseUrl.poster}${provider.tmDbPopular.results[index].backdropPath}",
                  width: 150,
                  height: 200,
                  callBack: () {})),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(1, index.isEven ? 1 : 1.5),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
      );
    },
  );

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
        body: _consumer);
  }
}
