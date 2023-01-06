import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/extensions/nav_extension.dart';
import 'package:movies_app/screens/movie_details_screen.dart';
import 'package:movies_app/widgets/custom_image.dart';
import 'package:movies_app/widgets/data_loading.dart';

import '../providers/movies_provider.dart';
import 'data_load_error.dart';

class CustomTabView extends ConsumerWidget {
  final List<String> tabs;
  const CustomTabView({required this.tabs, super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      padding: const EdgeInsets.only(right: 24),
      child: TabBarView(
        children: tabs.map(
          (tab) {
            final provider = moviesProvider(tab);
            final popularMovies = ref.watch(provider);
            return Tab(
              child: popularMovies.when(
                data: (movies) => GridView.builder(
                  addRepaintBoundaries: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      mainAxisExtent: MediaQuery.of(context).size.height * 0.2),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => context.push(
                      MovieDetailsScreen(id: movies[index].id),
                    ),
                    child: CustomImage(
                      posterUrl: movies[index].posterUrl,
                      isSmall: true,
                    ),
                  ),
                  itemCount: movies.length,
                ),
                error: (error, stackTrace) => DataLoadError(
                  provider: provider,
                ),
                loading: () => const DataLoading(),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
