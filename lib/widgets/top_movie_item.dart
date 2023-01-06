import 'package:flutter/material.dart';
import 'package:movies_app/extensions/nav_extension.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/screens/movie_details_screen.dart';
import 'package:movies_app/styles/app_colors.dart';
import 'package:movies_app/widgets/custom_image.dart';

class TopMovieItem extends StatelessWidget {
  final Movie movie;
  final String index;
  const TopMovieItem({required this.movie, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.push(
          MovieDetailsScreen(id: movie.id),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Stack(
          children: [
            SizedBox(
              height: screenSize.height * 0.3,
              width: screenSize.width * 0.43,
            ),
            Positioned(
              left: 10,
              child: CustomImage(posterUrl: movie.posterUrl),
            ),
            Positioned(
              bottom: 0,
              child: Stack(
                children: [
                  Text(
                    index,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    index,
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .apply(color: AppColors.canvasColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
