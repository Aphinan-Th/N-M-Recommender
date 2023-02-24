import 'package:flutter/material.dart';
import '../services/api-service.dart';

class NovelPage extends StatefulWidget {
  const NovelPage({super.key});

  @override
  State<NovelPage> createState() => _NovelPageState();
}

class _NovelPageState extends State<NovelPage> {
  late List _movieInfo = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _movieInfo = (await ApiService().getMovieInfo())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));

    debugPrint(_movieInfo as String);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
          itemCount: _movieInfo!.length,
          itemBuilder: (context, index) {
            return ListTile(title: _movieInfo[index]);
          })
    ]);
  }
}
