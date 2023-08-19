import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviechallenge/model/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev/";
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";
  static const String detailMovie = "movie?id=";

  static Future<List<MovieModel>> getPopularMovie() async {
    List<MovieModel> popularMovieInstance = [];
    final url = Uri.parse('$baseUrl$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> popularMovies = jsonDecode(response.body);
      for (var popularMovie in popularMovies["results"]) {
        popularMovieInstance.add(MovieModel.fromJson(popularMovie));
      }
      return popularMovieInstance;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getNowPlayingMovie() async {
    List<MovieModel> nowPlayingMovieInstance = [];
    final url = Uri.parse('$baseUrl$nowPlaying');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> nowPlayingMovies = jsonDecode(response.body);
      for (var nowplayingMovie in nowPlayingMovies["results"]) {
        nowPlayingMovieInstance.add(MovieModel.fromJson(nowplayingMovie));
      }
      return nowPlayingMovieInstance;
    }
    throw Error();
  }

  static Future<List<MovieModel>> getComingSoonMovie() async {
    List<MovieModel> comingSoonMovieInstance = [];
    final url = Uri.parse('$baseUrl$comingSoon');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> comingSoonMovies = jsonDecode(response.body);
      for (var comingSoonMovie in comingSoonMovies["results"]) {
        comingSoonMovieInstance.add(MovieModel.fromJson(comingSoonMovie));
      }
      return comingSoonMovieInstance;
    }
    throw Error();
  }
}
