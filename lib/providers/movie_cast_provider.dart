import 'package:movies_app/providers/movie_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/movie_cast.dart';
part 'movie_cast_provider.g.dart';

@riverpod
Future<List<MovieCast>> movieCast(MovieCastRef ref, int movieId) {
  return ref.read(movieServiceProvider).getCastList(movieId);
}
