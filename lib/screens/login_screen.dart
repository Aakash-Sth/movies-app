import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/widgets/auth_details.dart';

import '../sizes.dart';
import '../styles/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: const Text(
                    "Movies App",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.15,
                        fontSize: Sizes.heading,
                        color: AppColors.strokeColor),
                  ),
                ),
                Text(
                  "TMDB Login",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.15,
                    fontSize: Sizes.h3,
                  ),
                ),
                const AuthDetails()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
