import 'package:flutter/foundation.dart';
import 'package:nm_recommender/model/tmdb-model.dart';
import 'package:nm_recommender/services/api-service.dart';

class MovieProvider with ChangeNotifier {
  bool _isLoading = true;
  bool _hasError = false;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  TmDbPopular? _tmDbPopular;
  TmDbGenres? _tmDbGenres;
  TmDbPopular? get tmDbPopular => _tmDbPopular;
  TmDbGenres? get tmDbGenres => _tmDbGenres;
  int page = 0;

  Future<dynamic> fetchData() async {
    _isLoading = true;
    try {
      if (_tmDbPopular == null) {
        page++;
        _tmDbPopular = await getMoviePopular(page);
        print(_tmDbPopular);
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
