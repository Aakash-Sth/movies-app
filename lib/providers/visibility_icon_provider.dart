import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final iconProvider = NotifierProvider<VisibilityIconProvider, IconData>(
  () => VisibilityIconProvider(),
);

class VisibilityIconProvider extends Notifier<IconData> {
  @override
  IconData build() => Icons.visibility;

  void toggleIcon() {
    state = state == Icons.visibility ? Icons.visibility_off : Icons.visibility;
  }
}
