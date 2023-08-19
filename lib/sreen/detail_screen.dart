import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailMovieScreen extends StatelessWidget {
  final String title, overview, poster;
  final num rating;

  const DetailMovieScreen({
    super.key,
    required this.rating,
    required this.title,
    required this.poster,
    required this.overview,
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
              )),
          const SizedBox(height: 20),
          Text(title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
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
          Text(overview, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
