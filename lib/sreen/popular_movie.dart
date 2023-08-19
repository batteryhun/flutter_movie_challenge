import 'package:flutter/material.dart';
import 'package:moviechallenge/model/movie_model.dart';
import 'package:moviechallenge/service/api_service.dart';
import 'package:moviechallenge/sreen/detail_screen.dart';

class PopularMovie extends StatelessWidget {
  PopularMovie({super.key});

  Future<List<MovieModel>> popularMovies = ApiService.getPopularMovie();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: popularMovies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120),
                  const Text(
                    "Popular Movies",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(child: makePopularMovieList(snapshot)),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  ListView makePopularMovieList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      separatorBuilder: (context, index) {
        return const SizedBox(width: 10);
      },
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailMovieScreen(
                  rating: movie.rating,
                  title: movie.title,
                  poster: movie.poster,
                  overview: movie.overview,
                  releaseDate: movie.releaseDate,
                ),
              ),
            );
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: 200,
            child: Image.network(
              movie.poster,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
