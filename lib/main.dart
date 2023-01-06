import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/screens/initial_screen.dart';
import 'package:movies_app/styles/app_theme.dart';
import 'package:movies_app/screens/splash_screen.dart';

void main() async {
  debugInvertOversizedImages = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          title: 'Movies App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          themeMode: ThemeMode.dark,
          routes: {
            "/": (_) => const SplashScreen(),
            InitialScreen.routeName: (_) => const InitialScreen(),
          },
        ),
      ),
    );
  }
}
