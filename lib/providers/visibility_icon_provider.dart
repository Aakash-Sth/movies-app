import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final iconProvider = StateProvider<IconData>(
  (ref) => Icons.visibility,
);
