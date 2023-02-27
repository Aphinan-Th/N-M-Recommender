import 'package:flutter/material.dart';
import 'package:nm_recommender/model/tmdb-model.dart';
import 'package:nm_recommender/widgets/preview_image.dart';

import '../services/api-service.dart';

class NovelPage extends StatefulWidget {
  const NovelPage({super.key});

  @override
  State<NovelPage> createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  // var _movieInfo;

  // void _getData() async {
  //   dynamic response = await getMoviePopular();
  //   // TmDbPopular tmDbPopular = tmDbPopularFromJson(response);
  //   // _movieInfo = tmDbPopular;
  //   print(response);
  // }

  @override
  void initState() {
    super.initState();
    // _getData();
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     Expanded(
    //         child: Container(
    //       height: 100,
    //       color: Colors.red,
    //     )),
    //   ],
    // );
    return PreviewImage(
        callBack: () {
          Navigator.pop(context);
        },
        urlImage:
            'https://t1.blockdit.com/photos/2020/02/5e4c3cb093285c0c5fa2e436_800x0xcover_Pct_gKlC.jpg',
        width: 150,
        height: 200);
  }
}
