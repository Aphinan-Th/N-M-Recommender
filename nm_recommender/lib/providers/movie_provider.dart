import 'package:flutter/foundation.dart';
import 'package:nm_recommender/model/tmdb-model.dart';
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
  TmdbMovieGenre? _tmdbMovieGenre;

  int _genreId = 0;
  int index = 0;
  TmDbPopular? get tmDbPopular => _tmDbPopular;
  TmDbGenres? get tmDbGenres => _tmDbGenres;
  TmdbRecommend? get tmDbRecommend => _tmDbRecommend;
  TmdbUpcoming? get tmDbUpcoming => _tmDbUpcoming;
  TmdbTopRate? get tmdbTopRate => _tmdbTopRate;
  TmdbMovieGenre? get tmdbMovieGenre => _tmdbMovieGenre;

  int? get genreId => _genreId;
  int? get movieGenrePage => _movieGenrePage;

  int _popularPage = 1;
  int _recommendPage = 1;
  int _upcomingPage = 1;
  int _topRatePage = 1;
  int _movieGenrePage = 1;

  Future<dynamic> fetchData() async {
    int page = 1;
    _isLoading = true;
    try {
      page++;
      _tmDbPopular = await getMoviePopular(page);
      _tmDbRecommend = await getMovieRecommend(page);
      _tmDbUpcoming = await getMovieUpcoming(page);
      _tmdbTopRate = await getMovieTopRate(page);
      _tmDbGenres = await getGenres();
      notifyListeners();
      _hasError = false;
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //==============================Popular=========================================
  void increasePopularPage() {
    if (_popularPage == tmDbPopular?.totalPages) return;
    _popularPage++;
    updateDataPopular();
  }

  void reducePopularPage() {
    if (_popularPage <= 1) return;
    _popularPage--;
    updateDataPopular();
  }

  Future<dynamic> updateDataPopular() async {
    _isLoading = true;
    try {
      _tmDbPopular = await getMoviePopular(_popularPage);
      notifyListeners();
      _hasError = false;
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //==============================Recommend=========================================
  void increaseRecommendPage() {
    if (_recommendPage == tmDbRecommend?.totalPages) return;
    _recommendPage++;
    updateDataRecommend();
  }

  void reduceRecommendPage() {
    if (_recommendPage <= 1) return;
    _recommendPage--;
    updateDataRecommend();
  }

  Future<dynamic> updateDataRecommend() async {
    _isLoading = true;
    try {
      _tmDbPopular = await getMovieRecommend(_recommendPage);
      notifyListeners();
      _hasError = false;
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

//==============================Recommend=========================================
  void increaseUpcomingPage() {
    if (_upcomingPage == tmDbUpcoming?.totalPages) return;
    _upcomingPage++;
    updateDataUpcoming();
  }

  void reduceUpcomingPage() {
    if (_upcomingPage <= 1) return;
    _upcomingPage--;
    updateDataUpcoming();
  }

  Future<dynamic> updateDataUpcoming() async {
    _isLoading = true;
    try {
      _tmDbPopular = await getMovieUpcoming(_upcomingPage);
      notifyListeners();
      _hasError = false;
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //==============================Recommend=========================================
  void increaseTopRate() {
    if (_topRatePage == tmdbTopRate?.totalPages) return;
    _topRatePage++;
    updateDataTopRate();
  }

  void reduceTopRate() {
    if (_topRatePage <= 1) return;
    _topRatePage--;
    updateDataTopRate();
  }

  Future<dynamic> updateDataTopRate() async {
    _isLoading = true;
    try {
      _tmDbPopular = await getMovieTopRate(_topRatePage);
      notifyListeners();
      _hasError = false;
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

//==============================MovieByGenre=========================================
  void setGenreId(int id) {
    _genreId = id;
    updateMovieByGenre();
  }

  void increaseGenrePage() {
    if (_movieGenrePage == tmdbMovieGenre?.totalPages) return;
    _movieGenrePage++;
    updateMovieByGenre();
  }

  void reduceGenrePage() {
    if (_movieGenrePage <= 1) return;
    _movieGenrePage--;
    updateMovieByGenre();
  }

  Future<dynamic> updateMovieByGenre() async {
    _isLoading = true;
    try {
      _tmdbMovieGenre = await getMovieByGenre(_genreId,_movieGenrePage);
      notifyListeners();
      _hasError = false;
    } catch (e) {
      _hasError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //============================================================
  // Future<dynamic> fetchGenre() async {
  //   _isLoading = true;
  //   try {
  //     if (_tmDbGenres == null) {
  //       _tmDbGenres = await getGenres();
  //       notifyListeners();
  //       _hasError = false;
  //     }
  //   } catch (e) {
  //     _hasError = true;
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
}
