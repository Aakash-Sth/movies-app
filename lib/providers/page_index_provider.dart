import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_index_provider.g.dart';

final pageIndexProvider = NotifierProvider<PageNotifier, int>(() => PageNotifier());

@riverpod
class PageNotifier extends Notifier<int> {
  @override
  int build() {
    return 0; // Initial state
  }

  set selectedIndex(int index) {
    state = index; // Update the state with the new index
  }

  void increment() {
    state++; // Built-in modifier for mutating the state
  }
}
