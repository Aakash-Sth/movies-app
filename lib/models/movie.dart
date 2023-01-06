import 'package:movies_app/api_constants.dart';

class Movie {
  final int id;
  final String title;
  final String posterUrl;
  final String backdropUrl;
  final double rating;
  final String releaseDate;
  final int? runtime;
  final String genre;
  final String overview;

  Movie({
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.backdropUrl,
    required this.rating,
    required this.releaseDate,
    required this.runtime,
    required this.genre,
    required this.overview,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        posterUrl = "${ApiConstants.imageBaseUrl}${json["poster_path"]}",
        backdropUrl = "${ApiConstants.imageBaseUrl}${json["backdrop_path"]}",
        rating = json["vote_average"].runtimeType == int
            ? json["vote_average"].toDouble()
            : json["vote_average"],
        releaseDate = json["release_date"],
        runtime = json["runtime"],
        genre = json["genres"] == null || json["genres"].isEmpty
            ? "Not Available"
            : json["genres"][0]["name"],
        overview = json["overview"];
}
