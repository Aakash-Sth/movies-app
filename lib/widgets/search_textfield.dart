import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/providers/page_index_provider.dart';
import 'package:movies_app/providers/searched_movies_provider.dart';
import 'package:movies_app/providers/search_editing_controller_provider.dart';

import '../sizes.dart';
import '../styles/app_colors.dart';

class SearchTextField extends ConsumerWidget {
  final bool isHomeScreen;
  const SearchTextField({this.isHomeScreen = false, super.key});

  @override
  Widget build(BuildContext context, ref) {
    final searchController = ref.read(searchControllerProvider);

    void searchMovies() => ref
        .read(searchedMoviesProvider.notifier)
        .searchMovies(searchController.text);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          controller: searchController,
          textAlignVertical: TextAlignVertical.center,
          onFieldSubmitted: (_) => searchMovies(),
          decoration: InputDecoration(
            filled: true,
            hintText: "Search",
            fillColor: AppColors.textField,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.textField),
            ),
            hintStyle:
                const TextStyle(color: AppColors.hintText, fontSize: Sizes.h5),
            suffixIcon: IconButton(
              onPressed: () {
                if (isHomeScreen) {
                  ref.read(pageIndexProvider.notifier).state = 1;
                }
                searchMovies();
              },
              icon: SvgPicture.asset("assets/icons/search.svg"),
            ),
          ),
        ),
      ),
    );
  }
}
