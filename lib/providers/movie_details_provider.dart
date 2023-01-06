import 'package:movies_app/models/movie.dart';
import 'package:movies_app/providers/movie_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_details_provider.g.dart';

@riverpod
Future<Movie> movieDetails(MovieDetailsRef ref, int movieId) {
  return ref.read(movieServiceProvider).getMovieDetails(movieId);
}
