import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/movie.dart';

part 'basic_movie_data_provider.g.dart';

@riverpod
List<Map<String, dynamic>> basicMovieData(BasicMovieDataRef ref, Movie movie) {
  List<Map<String, dynamic>> datas = [
    {
      "icon": "assets/icons/calendarBlank.svg",
      "label": movie.releaseDate.isEmpty
          ? "No Date"
          : DateTime.parse(movie.releaseDate).year.toString()
    },
    {
      "icon": "assets/icons/clock.svg",
      "label": movie.runtime == 0 ? "Not Available" : "${movie.runtime} mins"
    },
    {"icon": "assets/icons/ticket.svg", "label": movie.genre},
  ];
  return datas;
}
