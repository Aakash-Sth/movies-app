import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movies_app/notifiers/auth_state.dart';
import 'package:movies_app/providers/auth_provider.dart';
import 'package:movies_app/screens/login_screen.dart';
import 'package:movies_app/screens/tabs_screen.dart';

class InitialScreen extends ConsumerStatefulWidget {
  static const routeName = "/loginScreen";
  const InitialScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => InitialScreenState();
}

class InitialScreenState extends ConsumerState {
  @override
  void initState() {
    Future.microtask(() => ref.read(authProvider.notifier).loadSessionId());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          const loginScreen = LoginScreen();
          if (authState is AuthLoaded) {
            String message = authState.message;
            if (message.isNotEmpty) {
              Fluttertoast.showToast(
                  msg: message, toastLength: Toast.LENGTH_SHORT);
            }
            return authState.sessionId.isEmpty
                ? loginScreen
                : const TabsScreen();
          } else if (authState is AuthLoading) {
            return loginScreen;
          } else {
            return const Text("Error");
          }
        },
      ),
    );
  }
}
