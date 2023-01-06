import 'package:movies_app/providers/movie_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/review.dart';

part 'movie_reviews_provider.g.dart';

@riverpod
Future<List<Review>> movieReviews(MovieReviewsRef ref, int movieId) {
  return ref.read(movieServiceProvider).getReviews(movieId);
}
