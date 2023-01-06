import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/providers/visibility_icon_provider.dart';

import '../sizes.dart';
import '../validator.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? validatorText;
  const CustomTextField(
      {required this.label,
      super.key,
      required this.controller,
      this.validatorText});

  @override
  Widget build(BuildContext context) {
    bool isObscure = true;
    bool isNotUsername = label != "Username";

    return Consumer(
      builder: (context, ref, child) {
        final icon = ref.watch(iconProvider);

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextFormField(
            style: GoogleFonts.roboto(
              fontSize: Sizes.title,
              letterSpacing: 0.15,
            ),
            controller: controller,
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                fontSize: Sizes.h6,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.15,
                color: Colors.white,
              ),
              label: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: Sizes.title,
                ),
              ),
              suffixIcon: isNotUsername
                  ? IconButton(
                      icon: Icon(icon),
                      onPressed: () {
                        icon == Icons.visibility
                            ? ref.read(iconProvider.notifier).state =
                                Icons.visibility_off
                            : ref.read(iconProvider.notifier).state =
                                Icons.visibility;
                        isObscure = !isObscure;
                      },
                    )
                  : null,
            ),
            obscureText: isNotUsername ? isObscure : false,
            obscuringCharacter: "*",
            validator: (value) {
              switch (label) {
                case "Username":
                  {
                    return Validator.validateUsername(value);
                  }
                case "Password":
                  {
                    return Validator.validatePassword(value);
                  }
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
