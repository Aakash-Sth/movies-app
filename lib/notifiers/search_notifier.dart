import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/notifiers/search_state.dart';
import 'package:movies_app/providers/movie_service_provider.dart';
import 'package:movies_app/services/movie_service.dart';

class SearchNotifier extends Notifier<SearchState> {
  late MovieService _movieService;

  @override
  SearchState build() {
    _movieService = ref.read(movieServiceProvider);

    return const SearchInitial();
  }

  String? _lastSearchedText;

  void searchMovies(String text) async {
    if (text.isNotEmpty && _lastSearchedText != text) {
      state = const SearchLoading();

      List<Movie> searchedMovies = await _movieService.searchMovies(text);
      state = SearchLoaded(movies: searchedMovies);
    }
    _lastSearchedText = text;
  }
}
