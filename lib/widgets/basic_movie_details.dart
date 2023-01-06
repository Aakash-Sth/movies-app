import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/models/movie.dart';
import 'package:movies_app/providers/basic_movie_data_provider.dart';

import 'custom_image.dart';
import 'top_image_stack.dart';

class BasicMovieDetails extends StatelessWidget {
  final Movie movie;
  const BasicMovieDetails({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: screenSize.height * 0.346,
            ),
            TopImageStack(
              backdropUrl: movie.backdropUrl,
              rating: movie.rating.toStringAsFixed(1),
            ),
            Positioned(
              bottom: 0,
              left: 29,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomImage(
                    posterUrl: movie.posterUrl,
                    isSmall: true,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.59,
                    child: Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Consumer(
            builder: (context, ref, child) {
              List<Map<String, dynamic>> datas =
                  ref.read(basicMovieDataProvider(movie));
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: datas
                    .map(
                      (data) => Row(
                        children: [
                          SvgPicture.asset(
                            data["icon"],
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            data["label"],
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .apply(color: Colors.grey),
                          ),
                          if (datas[datas.length - 1] != data)
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text("|"),
                            )
                        ],
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
