class MovieModel {
  final String title, poster, overview, releaseDate;
  final num rating;

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        poster = 'https://image.tmdb.org/t/p/w500/${json['poster_path']}',
        overview = json['overview'],
        releaseDate = json['release_date'],
        rating = json['vote_average'];
}
