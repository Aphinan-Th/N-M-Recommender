import 'package:flutter/foundation.dart';
import 'package:nm_recommender/model/tmdb-model.dart';
import 'package:nm_recommender/services/api-service.dart';

class MovieProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _hasError = false;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  TmDbPopular? _tmDbPopular;
  TmdbRecommend? _tmDbRecommend;
  TmDbGenres? _tmDbGenres;
  TmdbUpcoming? _tmDbUpcoming;
  TmdbTopRate? _tmdbTopRate;
  TmDbPopular? get tmDbPopular => _tmDbPopular;
  TmDbGenres? get tmDbGenres => _tmDbGenres;
  TmdbRecommend? get tmDbRecommend => _tmDbRecommend;
  TmdbUpcoming? get tmDbUpcoming => _tmDbUpcoming;
  TmdbTopRate? get tmdbTopRate => _tmdbTopRate;

  int page = 0;

  Future<dynamic> fetchData() async {
    _isLoading = true;
    try {
      if (_tmDbPopular == null || _tmDbRecommend == null) {
        page++;
        _tmDbPopular = await getMoviePopular(page);
        _tmDbRecommend = await getMovieRecommend(page);
        _tmDbUpcoming = await getMovieUpcoming(page);
        _tmdbTopRate = await getMovieTopRate(page);

        notifyListeners();
        _hasError = false;
      }
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  

  Future<dynamic> fetchGenre() async {
    _isLoading = true;
    try {
      if (_tmDbGenres == null) {
        _tmDbGenres = await getGenres();
        notifyListeners();
        _hasError = false;
      }
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
