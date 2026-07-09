// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_movie_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(basicMovieData)
final basicMovieDataProvider = BasicMovieDataFamily._();

final class BasicMovieDataProvider
    extends
        $FunctionalProvider<
          List<Map<String, dynamic>>,
          List<Map<String, dynamic>>,
          List<Map<String, dynamic>>
        >
    with $Provider<List<Map<String, dynamic>>> {
  BasicMovieDataProvider._({
    required BasicMovieDataFamily super.from,
    required Movie super.argument,
  }) : super(
         retry: null,
         name: r'basicMovieDataProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$basicMovieDataHash();

  @override
  String toString() {
    return r'basicMovieDataProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<Map<String, dynamic>> create(Ref ref) {
    final argument = this.argument as Movie;
    return basicMovieData(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Map<String, dynamic>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Map<String, dynamic>>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BasicMovieDataProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$basicMovieDataHash() => r'09367d1b19a941f654f11e78c978429075f7fa1d';

final class BasicMovieDataFamily extends $Family
    with $FunctionalFamilyOverride<List<Map<String, dynamic>>, Movie> {
  BasicMovieDataFamily._()
    : super(
        retry: null,
        name: r'basicMovieDataProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BasicMovieDataProvider call(Movie movie) =>
      BasicMovieDataProvider._(argument: movie, from: this);

  @override
  String toString() => r'basicMovieDataProvider';
}
