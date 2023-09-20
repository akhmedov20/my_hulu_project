// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  int page;
  List<SearchResult> results;
  int totalPages;
  int totalResults;

  SearchModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    page: json["page"]??0,
    results:json["results"] == null?<SearchResult>[]:List<SearchResult>.from(json["results"].map((x) => SearchResult.fromJson(x))),
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

class SearchResult {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  // OriginalLanguage originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  dynamic releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  SearchResult({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    // required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
    adult: json["adult"]??true,
    backdropPath: json["backdrop_path"]??"",
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"]??0,
    // originalLanguage: originalLanguageValues.map[json["original_language"]]!,
    originalTitle: json["original_title"]??"",
    overview: json["overview"]??"",
    popularity: json["popularity"]?.toDouble()??0.0,
    posterPath: json["poster_path"]??"",
    releaseDate: json["release_date"],
    title: json["title"]??"",
    video: json["video"]??true,
    voteAverage: json["vote_average"]?.toDouble()??0.0,
    voteCount: json["vote_count"]??0,
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    // "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}


// enum OriginalLanguage {
//   DE,
//   EN,
//   FA,
//   ZH
// }
//
// final originalLanguageValues = EnumValues({
//   "de": OriginalLanguage.DE,
//   "en": OriginalLanguage.EN,
//   "fa": OriginalLanguage.FA,
//   "zh": OriginalLanguage.ZH
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
