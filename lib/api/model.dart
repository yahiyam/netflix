// To parse this JSON data, do
//
//     final movieDatas = movieDatasFromJson(jsonString);

import 'dart:convert';

MovieDatas movieDatasFromJson(String str) =>
    MovieDatas.fromJson(json.decode(str));

String movieDatasToJson(MovieDatas data) => json.encode(data.toJson());

class MovieDatas {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  MovieDatas({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieDatas.fromJson(Map<String, dynamic> json) => MovieDatas(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  int? id;
  String? title;
  String? originalTitle;
  String? overview;
  String? posterPath;
  DateTime? releaseDate;
  Result({
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] ?? "",
        originalTitle: json["original_title"] ?? "",
        overview: json["overview"] ?? "",
        posterPath: json["poster_path"] ?? "",
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
      };
}

enum OriginalLanguage { eN, eS, nL, kO }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.eN,
  "es": OriginalLanguage.eS,
  "ko": OriginalLanguage.kO,
  "nl": OriginalLanguage.nL
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
