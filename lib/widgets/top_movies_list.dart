import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/widgets/data_loading.dart';

import '../providers/movies_provider.dart';
import 'data_load_error.dart';
import 'top_movie_item.dart';

class TopMoviesList extends ConsumerWidget {
  const TopMoviesList({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final popularMovies = ref.watch(moviesProvider("Trending"));
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * 0.3,
      child: popularMovies.when(
        data: (movies) => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => TopMovieItem(
            movie: movies[index],
            index: (index + 1).toString(),
          ),
          itemCount: movies.length,
        ),
        error: (error, stackTrace) => DataLoadError(
          provider: moviesProvider("Trending"),
        ),
        loading: () => const DataLoading(),
      ),
    );
  }
}
