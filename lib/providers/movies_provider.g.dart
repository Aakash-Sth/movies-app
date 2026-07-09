// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(movies)
final moviesProvider = MoviesFamily._();

final class MoviesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Movie>>,
          List<Movie>,
          FutureOr<List<Movie>>
        >
    with $FutureModifier<List<Movie>>, $FutureProvider<List<Movie>> {
  MoviesProvider._({
    required MoviesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'moviesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$moviesHash();

  @override
  String toString() {
    return r'moviesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Movie>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Movie>> create(Ref ref) {
    final argument = this.argument as String;
    return movies(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MoviesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$moviesHash() => r'0fa35e7e3232322e4b10284df5896d7cb4a150d4';

final class MoviesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Movie>>, String> {
  MoviesFamily._()
    : super(
        retry: null,
        name: r'moviesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MoviesProvider call(String category) =>
      MoviesProvider._(argument: category, from: this);

  @override
  String toString() => r'moviesProvider';
}
