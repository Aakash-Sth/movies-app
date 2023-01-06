import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/models/movie_cast.dart';
import 'package:movies_app/providers/movie_cast_provider.dart';
import 'package:movies_app/widgets/data_load_error.dart';
import 'package:movies_app/widgets/data_loading.dart';
import 'package:movies_app/widgets/image_load_error.dart';

class MovieCastGrid extends ConsumerWidget {
  final int id;
  const MovieCastGrid({required this.id, super.key});

  @override
  Widget build(BuildContext context, ref) {
    final mediaQuery = MediaQuery.of(context);
    final devicePixelRatio = mediaQuery.devicePixelRatio;
    final screenSize = mediaQuery.size;
    final imageSize = screenSize.height * 0.12;
    final cachedImageSize = (imageSize * devicePixelRatio).ceil();

    final castProvider = ref.watch(movieCastProvider(id));
    return castProvider.when(
      data: (castList) => castList.isEmpty
          ? const Text("No cast is available for this film.")
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 24),
              itemBuilder: (context, index) {
                MovieCast cast = castList[index];
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: cast.imageUrl,
                        height: imageSize,
                        width: imageSize,
                        memCacheHeight: cachedImageSize,
                        memCacheWidth: cachedImageSize,
                        fit: BoxFit.fill,
                        errorWidget: (context, url, error) =>
                            const ImageLoadError(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      cast.name,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                );
              },
              itemCount: castList.length,
            ),
      error: (error, stackTrace) => DataLoadError(
        provider: movieCastProvider(id),
      ),
      loading: () => const DataLoading(),
    );
  }
}
