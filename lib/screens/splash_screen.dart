import 'package:flutter/material.dart';
import 'package:movies_app/screens/initial_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () => Navigator.of(context).pushReplacementNamed(InitialScreen.routeName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "./assets/images/popcorn.png",
        ),
      ),
    );
  }
}
