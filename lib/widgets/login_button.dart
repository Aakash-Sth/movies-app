import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/notifiers/auth_state.dart';

import '../providers/auth_provider.dart';
import '../sizes.dart';
import '../styles/app_colors.dart';

class LoginButton extends ConsumerWidget {
  final GlobalKey<FormState> formkey;
  final Function authenticate;

  const LoginButton(
      {required this.authenticate, required this.formkey, super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Stack(
      children: [
        MaterialButton(
          onPressed: () {
            authenticate(ref);
          },
          padding: const EdgeInsets.symmetric(vertical: 13),
          minWidth: double.infinity,
          color: AppColors.strokeColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Text(
            "Login",
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.button,
                color: Colors.white),
          ),
        ),
        if (ref.watch(authProvider) is AuthLoading)
          Container(
            color: AppColors.canvasColor.withOpacity(0.2),
            height: 51,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
      ],
    );
  }
}
