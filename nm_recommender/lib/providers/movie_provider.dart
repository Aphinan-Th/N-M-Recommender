import 'package:flutter/foundation.dart';
import 'package:nm_recommender/model/tmdb-model.dart';
import 'package:nm_recommender/services/api-service.dart';

class MovieProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _hasError = false;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  TmDbPopular? _tmDbPopular;
  TmDbPopular get tmDbPopular => _tmDbPopular!;

  Future<dynamic> fetchData() async {
    _isLoading = true;
    try {
      if (_tmDbPopular == null) {
        _tmDbPopular = await getMoviePopular();
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
