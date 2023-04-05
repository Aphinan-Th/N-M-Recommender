import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nm_recommender/model/tmdb-model.dart';
import 'package:nm_recommender/widgets/loading.dart';
import '../assets/base_url.dart';
import '../assets/style.dart';
import 'preview_image.dart';

class StaggeredView extends StatelessWidget {
  TmDbPopular? tmDbPopular;
  TmdbRecommend? tmdbRecommend;
  TmdbTopRate? tmdbTopRate;
  TmdbUpcoming? tmdbUpcoming;
  TmdbMovieGenre? tmdbMovieGenre;
  bool isLoading;
  StaggeredView(
      {Key? key,
      this.tmDbPopular,
      this.tmdbRecommend,
      this.tmdbTopRate,
      this.tmdbUpcoming,
      this.tmdbMovieGenre,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic data = tmDbPopular ??
        tmdbRecommend ??
        tmdbTopRate ??
        tmdbUpcoming ??
        tmdbMovieGenre;
    if (data == null) {
      return const Center(child: LoadingScreen());
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: data.results.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final posterPath = data.results[index].posterPath;
          final urlImage = '${BaseUrl.poster}$posterPath';

          return Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: ThemeColor.shadow,
                  offset: Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: PreviewImage(
              isLoading: isLoading,
              urlImage: urlImage,
              width: 150,
              height: 200,
              callBack: () {},
            ),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.count(
          1,
          index.isEven ? 1 : 1.5,
        ),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
