import 'package:movies_app/api_constants.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/models/movie_cast.dart';
import 'package:movies_app/models/review.dart';
import 'package:movies_app/services/api_service.dart';

class MovieService {
  final ApiService _apiService;

  MovieService({required ApiService apiService}) : _apiService = apiService;

  String baseUrl = ApiConstants.baseUrl;
  String apiKey = ApiConstants.apiKey;
  Future<List<Movie>> getMovies(String category) async {
    String path = "movie/";
    switch (category) {
      case "Now Playing":
        path += "now_playing";
        break;
      case "Upcoming":
        path += "upcoming";
        break;
      case "Popular":
        path += "popular";
        break;
      case "Top Rated":
        path += "top_rated";
        break;
      default:
        path = "trending/movie/week";
    }
    List<Movie> movies = [];
    String uri = "$baseUrl/$path?api_key=$apiKey&page=1";
    final apiDatas = await _apiService.getApiData(uri);
    for (final apiData in apiDatas["results"]) {
      Movie movie = Movie.fromJson(apiData);
      movies.add(movie);
    }
    return movies;
  }

  Future<Movie> getMovieDetails(int id) async {
    String uri = "$baseUrl/movie/$id?api_key=$apiKey&page=1";
    final apiData = await _apiService.getApiData(uri);
    Movie movie = Movie.fromJson(apiData);
    return movie;
  }

  Future<List<Review>> getReviews(int id) async {
    String uri = "$baseUrl/movie/$id/reviews?api_key=$apiKey";
    List<Review> reviews = [];
    final apiDatas = await _apiService.getApiData(uri);
    for (final apiData in apiDatas["results"]) {
      Review review = Review.fromJson(apiData);
      reviews.add(review);
    }
    return reviews;
  }

  Future<List<MovieCast>> getCastList(int id) async {
    String uri = "$baseUrl/movie/$id/credits?api_key=$apiKey";
    List<MovieCast> castList = [];
    final apiDatas = await _apiService.getApiData(uri);
    for (final apiData in apiDatas["cast"]) {
      MovieCast cast = MovieCast.fromJson(apiData);
      castList.add(cast);
    }
    return castList;
  }

  Future<List<Movie>> searchMovies(String text) async {
    List<Movie> movies = [];
    String uri = "$baseUrl/search/movie?api_key=$apiKey&query=$text&page=1";
    if (text.isNotEmpty) {
      final apiDatas = await _apiService.getApiData(uri);

      for (final apiData in apiDatas["results"]) {
        if (movies.length == 3) {
          break;
        }
        Movie movie = await getMovieDetails(apiData["id"]);
        movies.add(movie);
      }
    }
    return movies;
  }
}
