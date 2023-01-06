import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/notifiers/search_state.dart';
import 'package:movies_app/providers/searched_movies_provider.dart';
import 'package:movies_app/widgets/data_loading.dart';
import 'package:movies_app/widgets/search_textfield.dart';
import 'package:movies_app/widgets/watch_list_item.dart';

import '../styles/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline))
        ],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                const SliverToBoxAdapter(
                  child: SearchTextField(),
                ),
              ],
          body: Consumer(
            builder: (context, ref, child) {
              final searchState = ref.watch(searchedMoviesProvider);
              if (searchState is SearchInitial) {
                return const Text("");
              } else if (searchState is SearchLoading) {
                return const DataLoading();
              } else if (searchState is SearchLoaded) {
                final searchedMovies = searchState.movies;
                return searchedMovies.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/searching.svg"),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 8),
                              child: Text(
                                "We Are Sorry, We Can\n Not Find The Movie :(",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(height: 1.5),
                              ),
                            ),
                            Text(
                              "Find your movie by type, title,\n categories, years, etc ",
                              style:
                                  Theme.of(context).textTheme.subtitle2!.apply(
                                        color: AppColors.hintText,
                                      ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) => WatchListItem(
                          movie: searchedMovies[index],
                        ),
                        itemCount: searchedMovies.length,
                      );
              } else {
                return const Center(child: Text("An error occured."));
              }
            },
          )),
    );
  }
}
