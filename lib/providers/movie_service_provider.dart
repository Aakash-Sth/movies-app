import 'package:movies_app/providers/api_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/movie_service.dart';

part "movie_service_provider.g.dart";

@riverpod
MovieService movieService(MovieServiceRef ref) {
  return MovieService(
    apiService: ref.read(apiServiceProvider),
  );
}
