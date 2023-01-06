import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../sizes.dart';
import '../styles/app_colors.dart';

class MovieRating extends StatelessWidget {
  final String rating;
  const MovieRating({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_border_rounded,
          color: AppColors.rating,
          size: 20,
        ),
        Text(
          rating,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.h6,
            color: AppColors.rating,
          ),
        )
      ],
    );
  }
}
