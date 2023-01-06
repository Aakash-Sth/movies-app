// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_reviews_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $movieReviewsHash() => r'd61576e5e5cdb77587f8a2bed371d447eedd7da7';

/// See also [movieReviews].
class MovieReviewsProvider extends AutoDisposeFutureProvider<List<Review>> {
  MovieReviewsProvider(
    this.movieId,
  ) : super(
          (ref) => movieReviews(
            ref,
            movieId,
          ),
          from: movieReviewsProvider,
          name: r'movieReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $movieReviewsHash,
        );

  final int movieId;

  @override
  bool operator ==(Object other) {
    return other is MovieReviewsProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef MovieReviewsRef = AutoDisposeFutureProviderRef<List<Review>>;

/// See also [movieReviews].
final movieReviewsProvider = MovieReviewsFamily();

class MovieReviewsFamily extends Family<AsyncValue<List<Review>>> {
  MovieReviewsFamily();

  MovieReviewsProvider call(
    int movieId,
  ) {
    return MovieReviewsProvider(
      movieId,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Review>> getProviderOverride(
    covariant MovieReviewsProvider provider,
  ) {
    return call(
      provider.movieId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'movieReviewsProvider';
}
