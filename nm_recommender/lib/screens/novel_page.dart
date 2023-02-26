import 'package:flutter/material.dart';
import '../services/api-service.dart';
class NovelPage extends StatefulWidget {
  const NovelPage({super.key});

  @override
  State<NovelPage> createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  var _movieInfo;

  void _getData() async {
    _movieInfo = await getMoviePopular();
    print(_movieInfo);
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
