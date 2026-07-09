import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/screens/initial_screen.dart';
import 'package:movies_app/screens/splash_screen.dart';
import 'package:movies_app/styles/app_theme.dart';

void main() async {
  debugInvertOversizedImages = true;
  WidgetsFlutterBinding.ensureInitialized();
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
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          // themeMode: ThemeMode.dark,
          routes: {
            "/": (_) => const SplashScreen(),
            InitialScreen.routeName: (_) => const InitialScreen(),
          },
        ),
      ),
    );
  }
}
