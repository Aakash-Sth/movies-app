import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/providers/movie_reviews_provider.dart';
import 'package:movies_app/widgets/data_load_error.dart';
import 'package:movies_app/widgets/data_loading.dart';
import 'package:movies_app/widgets/movie_review_item.dart';

class MovieReviewList extends ConsumerWidget {
  final int id;
  const MovieReviewList({required this.id, super.key});

  @override
  Widget build(BuildContext context, ref) {
    final reviewsProvider = ref.watch(movieReviewsProvider(id));

    return reviewsProvider.when(
      data: (reviews) {
        return reviews.isEmpty
            ? Text("No review is available for this film.",
                style: Theme.of(context).textTheme.subtitle1)
            : ListView.builder(
                itemBuilder: (context, index) => MovieReviewItem(
                  review: reviews[index],
                ),
                itemCount: reviews.length,
              );
      },
      error: (error, stackTrace) =>
          DataLoadError(provider: movieReviewsProvider(id)),
      loading: () => const DataLoading(),
    );
  }
}
