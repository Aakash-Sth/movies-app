import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/providers/movie_details_provider.dart';
import 'package:movies_app/providers/watch_list_provider.dart';
import 'package:movies_app/sizes.dart';
import 'package:movies_app/widgets/basic_movie_details.dart';
import 'package:movies_app/widgets/data_load_error.dart';
import 'package:movies_app/widgets/data_loading.dart';
import 'package:movies_app/widgets/movie_cast_grid.dart';
import 'package:movies_app/widgets/movie_review_list.dart';

import '../styles/app_colors.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final int id;
  const MovieDetailsScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context, ref) {
    final movieProvider = ref.watch(movieDetailsProvider(id));
    final watchList = ref.watch(watchListProvider);
    List<String> tabs = ["About Movie", "Reviews", "Cast"];
    return movieProvider.when(
      data: (movie) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Detail",
              style: Theme.of(context).textTheme.headline3,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  ref
                      .read(watchListProvider.notifier)
                      .toggleInWatchList(movieProvider.value!);
                },
                icon: Icon(watchList.contains(movieProvider.value!)
                    ? Icons.bookmark
                    : Icons.bookmark_border),
              )
            ],
          ),
          body: DefaultTabController(
            length: tabs.length,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      BasicMovieDetails(movie: movie),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 20,
                        ),
                        child: TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: const UnderlineTabIndicator(
                            borderSide: BorderSide(
                                color: AppColors.textField, width: 4),
                          ),
                          tabs: tabs
                              .map(
                                (tab) => Tab(
                                  child: Text(
                                    tab,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: TabBarView(
                  children: [
                    Text(
                      movie.overview.isEmpty
                          ? "No description available for this movie"
                          : movie.overview,
                      style: GoogleFonts.poppins(fontSize: Sizes.h6),
                    ),
                    MovieReviewList(id: movie.id),
                    MovieCastGrid(id: movie.id)
                  ],
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(),
        body: DataLoadError(
          provider: movieDetailsProvider(id),
        ),
      ),
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const DataLoading(),
      ),
    );
  }
}
