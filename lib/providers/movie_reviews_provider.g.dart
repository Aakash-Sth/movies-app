// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_reviews_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(movieReviews)
final movieReviewsProvider = MovieReviewsFamily._();

final class MovieReviewsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Review>>,
          List<Review>,
          FutureOr<List<Review>>
        >
    with $FutureModifier<List<Review>>, $FutureProvider<List<Review>> {
  MovieReviewsProvider._({
    required MovieReviewsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'movieReviewsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieReviewsHash();

  @override
  String toString() {
    return r'movieReviewsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Review>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Review>> create(Ref ref) {
    final argument = this.argument as int;
    return movieReviews(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieReviewsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieReviewsHash() => r'257326c9978ac69bb71ab79285390fa4755185d0';

final class MovieReviewsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Review>>, int> {
  MovieReviewsFamily._()
    : super(
        retry: null,
        name: r'movieReviewsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieReviewsProvider call(int movieId) =>
      MovieReviewsProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieReviewsProvider';
}
