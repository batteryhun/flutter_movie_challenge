import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailMovieScreen extends StatelessWidget {
  final String title, overview, poster, releaseDate;
  final num rating;

  const DetailMovieScreen({
    super.key,
    required this.rating,
    required this.title,
    required this.poster,
    required this.overview,
    required this.releaseDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: Image.network(
              poster,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${releaseDate.split('-')[1]}월 ${releaseDate.split('-')[2]}일 개봉",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                "$rating / 10",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(horizontal: 150),
            color: Colors.white,
            onPressed: () {},
            child: const Text(
              "Play",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(overview,
                style: const TextStyle(fontSize: 15, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
