import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

import '../../global/blocks/auth/cubit/auth_cubit.dart';
import '../../repositorys/auth_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final router = AutoRouter.of(context);
    FlutterAppAuth appAuth = FlutterAppAuth();

    return Scaffold(
      appBar: MainAppBar(
        title: "Login",
        elevation: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: LargeText(
                    text: "🥘",
                    fontSize: FontSize.veryLarge,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: LargeText(
                    text: "Register or sign in",
                    fontSize: FontSize.veryLarge,
                  ),
                ),
                const SizedBox(height: 20),
                const SmallText(text: 'Email'),
                const SizedBox(height: 4),
                TextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                const SmallText(text: 'Password'),
                const SizedBox(height: 4),
                TextField(
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 20),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () async => authCubit.login('kazu.kozu@hotmail.com', 'directustesti'),
                      child: state.inProgress
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const LargeText(
                              text: 'LOGIN',
                              fontSize: FontSize.medium,
                              color: Colors.white,
                            ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // NEW
                    backgroundColor: RecipeAppTheme.colors.blueAccent,
                  ),
                  onPressed: () async {
                    try {
                      // Present the dialog to the user
                      final result = await FlutterWebAuth.authenticate(
                          url:
                              "https://directus-em2ehfwczq-ew.a.run.app/auth/login/google?prompt=consent&redirect=https://directus-em2ehfwczq-ew.a.run.app/redirect-with-token?redirect=recipeslite://login-callback?refresh_token=",
                          callbackUrlScheme: "recipeslite");

                      final refreshToken = Uri.parse(result).queryParameters['refresh_token'];
                      print('response: $refreshToken');
                      if (refreshToken != null) {
                        authCubit.loginWithProvider(refreshToken);
                      }
                    } catch (e) {
                      return;
                    }
                  },
                  // onPressed: () async => showBottom,
                  child: LargeText(
                    text: 'LOGIN WITH GOOGLE',
                    fontSize: FontSize.medium,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: SmallText(
                    text: "or",
                    fontSize: FontSize.smallPlus,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => router.navigate(const SignUpRoute()),
                    child: SmallText(
                      text: "Create an account",
                      fontSize: FontSize.medium,
                      color: RecipeAppTheme.colors.pinkAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      switch (state.error) {
                        case AuthError.userNotExist:
                          return const Text('Wrong email');
                        case AuthError.invalidCredentials:
                          return const Text('Wrong password');

                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
