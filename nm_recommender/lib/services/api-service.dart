import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nm_recommender/model/tmdb-model.dart';

Future getMoviePopular() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8080/tmdb-movie-popular'));
  if (response.statusCode == 200) {
    // final data = jsonDecode(response.body);
    final tmDbPopular = tmDbPopularFromJson(response.body);
    return tmDbPopular;
  } else {
    throw Exception('Failed to fetch data');
  }
}
