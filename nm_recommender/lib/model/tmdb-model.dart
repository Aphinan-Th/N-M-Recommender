// To parse this JSON data, do
//
//     final tmDb = tmDbFromJson(jsonString);

import 'dart:convert';

TmDb tmDbFromJson(String str) => TmDb.fromJson(json.decode(str));

String tmDbToJson(TmDb data) => json.encode(data.toJson());

class TmDb {
    TmDb({
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

    factory TmDb.fromJson(Map<String, dynamic> json) => TmDb(
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
