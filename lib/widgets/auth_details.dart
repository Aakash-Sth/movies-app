import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/notifiers/auth_state.dart';
import 'package:movies_app/providers/auth_provider.dart';
import 'package:movies_app/widgets/custom_textfield.dart';
import 'package:movies_app/widgets/login_button.dart';

class AuthDetails extends StatefulWidget {
  const AuthDetails({super.key});

  @override
  State<AuthDetails> createState() => _AuthDetailsState();
}

class _AuthDetailsState extends State<AuthDetails> {
  final usernameControllerProvider = TextEditingController();
  final passwordController = TextEditingController();
  final confmPasswordController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    usernameControllerProvider.dispose();
    passwordController.dispose();
    confmPasswordController.dispose();
    super.dispose();
  }

  void authenticate(WidgetRef ref) async {
    final username = usernameControllerProvider.text;
    final password = passwordController.text;
    if (formkey.currentState!.validate()) {
      await ref.read(authProvider.notifier).authenticate(username: username, password: password);
      AuthState state = ref.read(authProvider);
      if (state.runtimeType == AuthLoaded) {
        state = state as AuthLoaded;
        if (state.sessionId.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful")));
          // Fluttertoast.showToast(
          //     msg: message, toastLength: Toast.LENGTH_SHORT);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      }
    }

    // ref.listen(authProvider.notifier, (previous, next) {
    //   if (next.runtimeType == AuthLoaded) {
    //     if (next.sessionId != null && next.sessionId!.isNotEmpty) {
    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successful")));
    //       // Fluttertoast.showToast(
    //       //     msg: message, toastLength: Toast.LENGTH_SHORT);
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> textFieldDetails = [
      {"label": "Username", "controller": usernameControllerProvider},
      {"label": "Password", "controller": passwordController},
    ];
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Form(
            key: formkey,
            child: Column(
              children: [
                ...textFieldDetails.map(
                  (textFieldDetail) => CustomTextField(
                    label: textFieldDetail["label"],
                    controller: textFieldDetail["controller"],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              LoginButton(authenticate: authenticate, formkey: formkey),
              Consumer(
                builder: (_, ref, _) => TextButton(
                  onPressed: () async {
                    await ref.read(authProvider.notifier).createGuestSession();
                    AuthState state = ref.read(authProvider);
                    if (state.runtimeType == AuthLoaded) {
                      state = state as AuthLoaded;
                      if (state.sessionId.isNotEmpty) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("Login Successful")));
                        // Fluttertoast.showToast(
                        //     msg: message, toastLength: Toast.LENGTH_SHORT);
                      }
                    }
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStateColor.resolveWith((_) => Colors.white12),
                  ),
                  child: Text("Login as Guest", style: Theme.of(context).textTheme.headlineMedium),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
