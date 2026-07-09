// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_index_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PageNotifier)
final pageProvider = PageNotifierProvider._();

final class PageNotifierProvider extends $NotifierProvider<PageNotifier, int> {
  PageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pageNotifierHash();

  @$internal
  @override
  PageNotifier create() => PageNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$pageNotifierHash() => r'ce82562306110d65a3ce5fc006e40eb8daefbfb2';

abstract class _$PageNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
