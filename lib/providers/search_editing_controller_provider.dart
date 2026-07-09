import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchControllerProvider =
    NotifierProvider<SearchEditingControllerProvider, TextEditingController>(() {
      return SearchEditingControllerProvider();
    });

class SearchEditingControllerProvider extends Notifier<TextEditingController> {
  @override
  TextEditingController build() {
    final searchController = TextEditingController();
    ref.onDispose(() => searchController.dispose());
    return searchController;
  }
}
