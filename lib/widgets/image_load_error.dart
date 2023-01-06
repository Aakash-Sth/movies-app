import 'package:flutter/material.dart';
import 'package:movies_app/styles/app_colors.dart';

class ImageLoadError extends StatelessWidget {
  const ImageLoadError({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.textField,
      child: Center(
        child: Icon(
          Icons.error,
        ),
      ),
    );
  }
}
