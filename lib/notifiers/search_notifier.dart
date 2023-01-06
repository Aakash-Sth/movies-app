import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/notifiers/search_state.dart';
import 'package:movies_app/services/movie_service.dart';

class SearchNotifier extends StateNotifier<SearchState> {
  final MovieService _movieService;
  SearchNotifier({required MovieService movieService})
      : _movieService = movieService,
        super(const SearchInitial());

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
