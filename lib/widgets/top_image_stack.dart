import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/styles/app_colors.dart';
import 'package:movies_app/widgets/image_load_error.dart';
import 'package:movies_app/widgets/movie_rating.dart';

class TopImageStack extends StatelessWidget {
  final String backdropUrl;
  final String rating;
  const TopImageStack(
      {required this.backdropUrl, required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(16)),
          child: CachedNetworkImage(
            imageUrl: backdropUrl,
            height: screenSize.height * 0.27,
            width: double.infinity,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const ImageLoadError(),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.ratingContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: MovieRating(rating: rating),
          ),
        )
      ],
    );
  }
}
