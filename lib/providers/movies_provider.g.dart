// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_provider.dart';

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

String $moviesHash() => r'7edd1a04abdf184ff6129dcf60dceb980dd14445';

/// See also [movies].
class MoviesProvider extends AutoDisposeFutureProvider<List<Movie>> {
  MoviesProvider(
    this.category,
  ) : super(
          (ref) => movies(
            ref,
            category,
          ),
          from: moviesProvider,
          name: r'moviesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $moviesHash,
        );

  final String category;

  @override
  bool operator ==(Object other) {
    return other is MoviesProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef MoviesRef = AutoDisposeFutureProviderRef<List<Movie>>;

/// See also [movies].
final moviesProvider = MoviesFamily();

class MoviesFamily extends Family<AsyncValue<List<Movie>>> {
  MoviesFamily();

  MoviesProvider call(
    String category,
  ) {
    return MoviesProvider(
      category,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Movie>> getProviderOverride(
    covariant MoviesProvider provider,
  ) {
    return call(
      provider.category,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'moviesProvider';
}
