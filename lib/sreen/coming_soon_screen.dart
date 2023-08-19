import 'package:flutter/material.dart';
import 'package:moviechallenge/model/movie_model.dart';
import 'package:moviechallenge/service/api_service.dart';
import 'package:moviechallenge/sreen/detail_screen.dart';

class ComingSoonScreen extends StatelessWidget {
  ComingSoonScreen({super.key});

  Future<List<MovieModel>> comingSoonMovies = ApiService.getComingSoonMovie();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: comingSoonMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Coming Soon",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
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
                          width: 140,
                          child: Image.network(
                            movie.poster,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10);
                    },
                    itemCount: snapshot.data!.length,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
