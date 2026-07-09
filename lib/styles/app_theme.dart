import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/styles/app_colors.dart';

import '../sizes.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get appTheme => ThemeData(
    inputDecorationTheme: AppTheme.inputDecorationTheme,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: AppColors.canvasColor,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: ThemeData.light().textTheme
        .copyWith(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.s96,
            foreground: Paint()
              ..strokeWidth = 1.5
              ..style = PaintingStyle.stroke
              ..color = AppColors.strokeColor,
          ),
          // headline2: const TextStyle(
          //   fontWeight: FontWeight.w600,
          //   fontSize: Sizes.h1,
          // ),
          headlineMedium: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: Sizes.s18),
          headlineSmall: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: Sizes.s14),
          bodyMedium: const TextStyle(fontWeight: FontWeight.w600, fontSize: Sizes.s16),
          bodySmall: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: Sizes.s14),
          labelSmall: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: Sizes.s12),
          labelMedium: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: Sizes.s12,
            letterSpacing: 0.12,
            height: 1.5,
          ),
        )
        .apply(bodyColor: Colors.white, displayColor: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white),
  );

  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    suffixIconColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.error)) {
        return AppColors.errorColor;
      } else if (states.contains(WidgetState.focused)) {
        return AppColors.strokeColor;
      }
      return AppColors.defaultColor;
    }),
    floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
      TextStyle style = const TextStyle(color: Colors.white);
      if (states.contains(WidgetState.error)) {
        return style.copyWith(color: AppColors.errorColor);
      } else if (states.contains(WidgetState.focused)) {
        return style.copyWith(color: AppColors.strokeColor);
      }
      return style;
    }),
    border: WidgetStateInputBorder.resolveWith((states) {
      OutlineInputBorder inputBorder = const OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.defaultColor),
      );
      if (states.contains(WidgetState.error)) {
        return inputBorder.copyWith(borderSide: const BorderSide(color: AppColors.errorColor));
      } else if (states.contains(WidgetState.focused)) {
        return inputBorder.copyWith(
          borderSide: const BorderSide(color: AppColors.strokeColor, width: 1.2),
        );
      }
      return inputBorder;
    }),
    labelStyle: const TextStyle(color: Colors.black),
  );
}
