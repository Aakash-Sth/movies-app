import 'package:movies_app/models/movie.dart';
import 'package:movies_app/providers/movie_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movies_provider.g.dart';

@riverpod
Future<List<Movie>> movies(MoviesRef ref, String category) {
  return ref.read(movieServiceProvider).getMovies(category);
}
