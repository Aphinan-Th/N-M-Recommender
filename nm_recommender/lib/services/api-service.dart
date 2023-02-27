import 'package:http/http.dart' as http;
import 'package:nm_recommender/model/tmdb-model.dart';

Future getMoviePopular(int page) async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8080/tmdb-movie-popular?page=$page'));
  if (response.statusCode == 200) {
    // final data = jsonDecode(response.body);
    final tmDbPopular = tmDbPopularFromJson(response.body);
    return tmDbPopular;
  } else {
    throw Exception('Failed to fetch data');
  }
}

Future getGenres() async {
  final response = await http.get(Uri.parse(
      "https://api.themoviedb.org/3/genre/movie/list?api_key=7d2b91f400ce0e8625786102fdf95451&language=en-US"));
  if (response.statusCode == 200) {
    final tmDbGenres = tmDbGenresFromJson(response.body);
    return tmDbGenres;
  } else {
    throw Exception('Failed to fetch data');
  }
}
