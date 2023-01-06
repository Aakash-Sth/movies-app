import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/extensions/nav_extension.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/screens/movie_details_screen.dart';
import 'package:movies_app/sizes.dart';
import 'package:movies_app/widgets/custom_image.dart';
import 'package:movies_app/widgets/movie_rating.dart';

import '../providers/basic_movie_data_provider.dart';

class WatchListItem extends ConsumerWidget {
  final Movie movie;
  const WatchListItem({required this.movie, super.key});

  @override
  Widget build(BuildContext context, ref) {
    List<Map<String, dynamic>> datas = ref.read(basicMovieDataProvider(movie));
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => context.push(
        MovieDetailsScreen(id: movie.id),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: IntrinsicHeight(
          child: Row(
            children: [
              CustomImage(
                posterUrl: movie.posterUrl,
                isSmall: true,
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.49,
                    child: Text(
                      movie.title,
                      style: GoogleFonts.poppins(fontSize: Sizes.title),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  MovieRating(
                    rating: movie.rating.toStringAsFixed(1),
                  ),
                  ...datas.map(
                    (data) => Row(
                      children: [
                        SvgPicture.asset(
                          data["icon"],
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(data["label"],
                            style: Theme.of(context).textTheme.headline6!),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
