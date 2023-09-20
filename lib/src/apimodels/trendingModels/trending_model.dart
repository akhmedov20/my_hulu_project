// To parse this JSON data, do
//
//     final secondMovieModel = secondMovieModelFromJson(jsonString);

import 'dart:convert';

TrendingModel secondMovieModelFromJson(String str) => TrendingModel.fromJson(json.decode(str));

String secondMovieModelToJson(TrendingModel data) => json.encode(data.toJson());

class TrendingModel {
  int page;
  List<TrendingResult> results;
  int totalPages;
  int totalResults;

  TrendingModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TrendingModel.fromJson(Map<String, dynamic> json) => TrendingModel(
    page: json["page"]??0,
    results: json["results"] == null?<TrendingResult>[]:List<TrendingResult>.from(json["results"].map((x) => TrendingResult.fromJson(x))),
    totalPages: json["total_pages"]??0,
    totalResults: json["total_results"]??0,
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class TrendingResult {
  bool adult;
  String backdropPath;
  int id;
  String title;
  String originalTitle;
  String overview;
  String posterPath;
  // List<int> genreIds;
  double popularity;
  DateTime releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  TrendingResult({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    // required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TrendingResult.fromJson(Map<String, dynamic> json) => TrendingResult(
    adult: json["adult"]??true,
    backdropPath: json["backdrop_path"]??"",
    id: json["id"]??0,
    title: json["title"]??"",
    originalTitle: json["original_title"]??"",
    overview: json["overview"]??"",
    posterPath: json["poster_path"]??"",
    // genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    popularity: json["popularity"].toDouble()??0.0,
    releaseDate: DateTime.parse(json["release_date"]),
    video: json["video"]??true,
    voteAverage: json["vote_average"].toDouble()??0.0,
    voteCount: json["vote_count"]??0,
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "id": id,
    "title": title,
    "original_title": originalTitle,
    "overview": overview,
    "poster_path": posterPath,
    // "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "popularity": popularity,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

enum MediaType {
  MOVIE
}

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE
});

enum OriginalLanguage {
  EN,
  NL,
  SV
}

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "nl": OriginalLanguage.NL,
  "sv": OriginalLanguage.SV
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
