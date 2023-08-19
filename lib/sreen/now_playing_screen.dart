import 'package:flutter/material.dart';
import 'package:moviechallenge/model/movie_model.dart';
import 'package:moviechallenge/service/api_service.dart';

class NowPlayingScreen extends StatelessWidget {
  NowPlayingScreen({super.key});

  Future<List<MovieModel>> nowPlayingMovies = ApiService.getNowPlayingMovie();

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
