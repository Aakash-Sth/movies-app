import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/models/movie.dart';

class WatchListNotifier extends Notifier<List<Movie>> {
  @override
  List<Movie> build() => const [];

  void toggleInWatchList(Movie movie) {
    state.contains(movie)
        ? state = state.where((stateItem) => stateItem.id != movie.id).toList()
        : state = [...state, movie];
  }
}
