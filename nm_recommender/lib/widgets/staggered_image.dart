import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nm_recommender/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../assets/base_url.dart';
import '../assets/style.dart';
import '../providers/movie_provider.dart';
import 'preview_image.dart';

class StaggeredView extends StatelessWidget {
  const StaggeredView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, provider, child) {
        final results = provider.tmDbPopular?.results;
        final length = results?.length ?? 0;

        if (results == null || length == 0) {
          return Center(child: LoadingScreen());
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: length,
            itemBuilder: (BuildContext context, int index) {
              final posterPath = results[index].posterPath;
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
                  isLoading: provider.isLoading,
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
      },
    );
  }
}
