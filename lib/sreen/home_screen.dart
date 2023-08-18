import 'package:flutter/material.dart';
import 'package:moviechallenge/sreen/popular_movie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130,
        backgroundColor: Colors.grey.withOpacity(0.7),
        leading: const Center(
          child: Text(
            "For John",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.home),
          SizedBox(width: 10),
          Icon(Icons.account_circle),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 300, child: PopularMovie()),
        ],
      ),
    );
  }
}
