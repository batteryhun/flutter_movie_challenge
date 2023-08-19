import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moviechallenge/sreen/coming_soon_screen.dart';
import 'package:moviechallenge/sreen/now_playing_screen.dart';
import 'package:moviechallenge/sreen/popular_movie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        elevation: 0,
        leadingWidth: 130,
        backgroundColor: Colors.grey.withOpacity(0.5),
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
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 450, child: PopularMovie()),
              SizedBox(height: 200, child: NowPlayingScreen()),
              SizedBox(height: 200, child: ComingSoonScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
