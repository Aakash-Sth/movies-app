import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/notifiers/watch_list_notifier.dart';

final watchListProvider = StateNotifierProvider<WatchListNotifier, List<Movie>>(
  (ref) => WatchListNotifier(),
);
