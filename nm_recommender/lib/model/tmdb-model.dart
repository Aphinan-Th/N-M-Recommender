// To parse this JSON data, do
//
//     final tmDbPopular = tmDbPopularFromJson(jsonString);

import 'dart:convert';

TmDbPopular tmDbPopularFromJson(String str) => TmDbPopular.fromJson(json.decode(str));

String tmDbPopularToJson(TmDbPopular data) => json.encode(data.toJson());

class TmDbPopular {
    TmDbPopular({
        required this.id,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int id;
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    factory TmDbPopular.fromJson(Map<String, dynamic> json) => TmDbPopular(
        id: json["ID"],
        page: json["Page"],
        results: List<Result>.from(json["Results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Page": page,
        "Results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
    Result({
        required this.adult,
        required this.backdropPath,
        required this.id,
        required this.originalTitle,
        required this.genreIds,
        required this.popularity,
        required this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.overview,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    bool adult;
    String backdropPath;
    int id;
    String originalTitle;
    List<int> genreIds;
    double popularity;
    String posterPath;
    DateTime releaseDate;
    String title;
    String overview;
    bool video;
    double voteAverage;
    int voteCount;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        overview: json["overview"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "id": id,
        "original_title": originalTitle,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "overview": overview,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

// To parse this JSON data, do
//
//     final tmDbGenres = tmDbGenresFromJson(jsonString);

TmDbGenres tmDbGenresFromJson(String str) => TmDbGenres.fromJson(json.decode(str));
String tmDbGenresToJson(TmDbGenres data) => json.encode(data.toJson());

class TmDbGenres {
    TmDbGenres({
        required this.genres,
    });

    List<Genre> genres;

    factory TmDbGenres.fromJson(Map<String, dynamic> json) => TmDbGenres(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    };
}

class Genre {
    Genre({
        required this.id,
        required this.name,
    });

    int id;
    String name;

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
