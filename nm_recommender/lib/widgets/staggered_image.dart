import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nm_recommender/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../assets/base_url.dart';
import '../assets/style.dart';
import '../providers/movie_provider.dart';
import 'preview_image.dart';

class StaggeredView extends StatefulWidget {
  const StaggeredView({super.key});

  @override
  State<StaggeredView> createState() => _StaggeredViewState();
}

class _StaggeredViewState extends State<StaggeredView> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<MovieProvider>(context, listen: false);
    provider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieProvider>(context, listen: false);
    final length = provider.tmDbPopular?.results.length;
    final results = provider.tmDbPopular?.results;
    if (results == null || length == null) {
      return Center(child: LoadingScreen());
    }
    return Consumer<MovieProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: length,
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
                    isLoading: provider.isLoading,
                    urlImage: "${BaseUrl.poster}${results[index].posterPath}",
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
  }
}
