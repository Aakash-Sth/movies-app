import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/notifiers/search_notifier.dart';
import 'package:movies_app/providers/movie_service_provider.dart';

final searchedMoviesProvider = StateNotifierProvider(
  (ref) => SearchNotifier(
    movieService: ref.read(movieServiceProvider),
  ),
);
