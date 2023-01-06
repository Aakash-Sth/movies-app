import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/styles/app_colors.dart';

import '../sizes.dart';

class AppTheme {
  AppTheme._();
  static get appTheme => ThemeData(
        inputDecorationTheme: AppTheme.inputDecorationTheme,
        primaryColor: Colors.white,
        canvasColor: AppColors.canvasColor,
        fontFamily: const TextStyle().fontFamily,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true),
        textTheme: ThemeData.dark()
            .textTheme
            .copyWith(
              headline1: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.h1,
                  foreground: Paint()
                    ..strokeWidth = 1.5
                    ..style = PaintingStyle.stroke
                    ..color = AppColors.strokeColor),
              headline2: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.h1,
              ),
              headline4: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: Sizes.h4),
              headline5: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: Sizes.h5,
              ),
              headline3: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.title,
              ),
              headline6: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: Sizes.h5),
              subtitle1: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: Sizes.h6),
              subtitle2: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: Sizes.h6,
                  letterSpacing: 0.12,
                  height: 1.5),
            )
            .apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        iconTheme: const IconThemeData(color: Colors.white),
      );

  static get inputDecorationTheme => InputDecorationTheme(
        suffixIconColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.error)) {
              return AppColors.errorColor;
            } else if (states.contains(MaterialState.focused)) {
              return AppColors.strokeColor;
            }
            return AppColors.defaultColor;
          },
        ),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith(
          (states) {
            TextStyle style = const TextStyle(color: Colors.white);
            if (states.contains(MaterialState.error)) {
              return style.copyWith(color: AppColors.errorColor);
            } else if (states.contains(MaterialState.focused)) {
              return style.copyWith(color: AppColors.strokeColor);
            }
            return style;
          },
        ),
        border: MaterialStateOutlineInputBorder.resolveWith(
          (states) {
            OutlineInputBorder inputBorder = const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.defaultColor));
            if (states.contains(MaterialState.error)) {
              return inputBorder.copyWith(
                  borderSide: const BorderSide(color: AppColors.errorColor));
            } else if (states.contains(MaterialState.focused)) {
              return inputBorder.copyWith(
                  borderSide: const BorderSide(
                      color: AppColors.strokeColor, width: 1.2));
            }
            return inputBorder;
          },
        ),
        labelStyle: const TextStyle(color: Colors.black),
      );
}
