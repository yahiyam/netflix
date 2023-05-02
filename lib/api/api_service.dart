import 'dart:convert';

import 'model.dart';
import 'package:http/http.dart' as http;

class TmdbApi {
  static const String apiKey = "1ae889e7b7c4312d9c0e5ed1f94c0722";
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static Future<List<Result>> fetchMoviesByType(
      String film, String type) async {
    // Send a GET request to the movie API's endpoint for movies
    final response = await http.get(
      Uri.parse(
        "$baseUrl/$film/$type?api_key=$apiKey",
      ),
    );

    // If the response was successful, parse the JSON data and return a list of movie results
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Result> results = [];
      for (var result in data["results"]) {
        results.add(
          Result.fromJson(result),
        );
      }
      return results;
    } else {
      // If the response was unsuccessful, throw an exception with an error message
      throw Exception("Failed to fetch movies");
    }
  }

  static Future<MovieDatas> searchMovies(String query) async {
    final response = await http.get(
      Uri.parse(
        "$baseUrl/search/movie?api_key=$apiKey&query=$query",
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return MovieDatas.fromJson(data);
    } else {
      throw Exception("Failed to search movies");
    }
  }

  static String getPosterImageUrl(String path) {
    return 'https://image.tmdb.org/t/p/w500$path';
  }
}
