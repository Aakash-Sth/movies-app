import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/notifiers/search_notifier.dart';
import 'package:movies_app/notifiers/search_state.dart';

final searchedMoviesProvider = NotifierProvider<SearchNotifier, SearchState>(
  () => SearchNotifier(),
);
