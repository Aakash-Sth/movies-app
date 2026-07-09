// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(movieDetails)
final movieDetailsProvider = MovieDetailsFamily._();

final class MovieDetailsProvider
    extends $FunctionalProvider<AsyncValue<Movie>, Movie, FutureOr<Movie>>
    with $FutureModifier<Movie>, $FutureProvider<Movie> {
  MovieDetailsProvider._({
    required MovieDetailsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'movieDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieDetailsHash();

  @override
  String toString() {
    return r'movieDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Movie> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Movie> create(Ref ref) {
    final argument = this.argument as int;
    return movieDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieDetailsHash() => r'97a55e6e4c023853655cf633693a1b2ff05aa5f1';

final class MovieDetailsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Movie>, int> {
  MovieDetailsFamily._()
    : super(
        retry: null,
        name: r'movieDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieDetailsProvider call(int movieId) =>
      MovieDetailsProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieDetailsProvider';
}
