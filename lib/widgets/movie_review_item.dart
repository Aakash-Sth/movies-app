import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/review.dart';
import 'package:movies_app/sizes.dart';
import 'package:movies_app/styles/app_colors.dart';
import 'package:movies_app/widgets/image_load_error.dart';

class MovieReviewItem extends StatelessWidget {
  final Review review;
  const MovieReviewItem({required this.review, super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final devicePixelRatio = mediaQuery.devicePixelRatio;
    final screenSize = mediaQuery.size;
    final imageSize = screenSize.height * 0.05;
    final cachedImageSize = (imageSize * devicePixelRatio).ceil();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: review.avatarUrl,
                  width: imageSize,
                  height: imageSize,
                  memCacheWidth: cachedImageSize,
                  memCacheHeight: cachedImageSize,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const ImageLoadError(),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                review.rating.toString(),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .apply(color: AppColors.strokeColor),
              )
            ],
          ),
          SizedBox(
            width: screenSize.width * 0.035,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(review.author, style: Theme.of(context).textTheme.subtitle1),
              Container(
                padding: const EdgeInsets.only(top: 3),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  review.content,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: Sizes.h6, height: 1.5),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
