// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_movie_data_provider.dart';

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

String $basicMovieDataHash() => r'ac9043a252471e62c638b5ad61e3545961b2b690';

/// See also [basicMovieData].
class BasicMovieDataProvider
    extends AutoDisposeProvider<List<Map<String, dynamic>>> {
  BasicMovieDataProvider(
    this.movie,
  ) : super(
          (ref) => basicMovieData(
            ref,
            movie,
          ),
          from: basicMovieDataProvider,
          name: r'basicMovieDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $basicMovieDataHash,
        );

  final Movie movie;

  @override
  bool operator ==(Object other) {
    return other is BasicMovieDataProvider && other.movie == movie;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movie.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef BasicMovieDataRef = AutoDisposeProviderRef<List<Map<String, dynamic>>>;

/// See also [basicMovieData].
final basicMovieDataProvider = BasicMovieDataFamily();

class BasicMovieDataFamily extends Family<List<Map<String, dynamic>>> {
  BasicMovieDataFamily();

  BasicMovieDataProvider call(
    Movie movie,
  ) {
    return BasicMovieDataProvider(
      movie,
    );
  }

  @override
  AutoDisposeProvider<List<Map<String, dynamic>>> getProviderOverride(
    covariant BasicMovieDataProvider provider,
  ) {
    return call(
      provider.movie,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'basicMovieDataProvider';
}
