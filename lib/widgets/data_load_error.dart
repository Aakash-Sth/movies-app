import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataLoadError extends ConsumerWidget {
  final Refreshable? provider;
  const DataLoadError({this.provider, super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Failed to load data.Check your\n Internet connection and try again.",
            textAlign: TextAlign.center,
            style: TextStyle(height: 1.25, letterSpacing: 0.25),
          ),
          IconButton(
            onPressed: () => ref.refresh(provider!),
            icon: const Icon(Icons.replay_outlined),
          )
        ],
      ),
    );
  }
}
