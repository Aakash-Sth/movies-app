// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cast_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(movieCast)
final movieCastProvider = MovieCastFamily._();

final class MovieCastProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MovieCast>>,
          List<MovieCast>,
          FutureOr<List<MovieCast>>
        >
    with $FutureModifier<List<MovieCast>>, $FutureProvider<List<MovieCast>> {
  MovieCastProvider._({
    required MovieCastFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'movieCastProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieCastHash();

  @override
  String toString() {
    return r'movieCastProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<MovieCast>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MovieCast>> create(Ref ref) {
    final argument = this.argument as int;
    return movieCast(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieCastProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieCastHash() => r'c77fc1fa9607d96459a57e4534e06227636571f7';

final class MovieCastFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<MovieCast>>, int> {
  MovieCastFamily._()
    : super(
        retry: null,
        name: r'movieCastProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieCastProvider call(int movieId) =>
      MovieCastProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieCastProvider';
}
