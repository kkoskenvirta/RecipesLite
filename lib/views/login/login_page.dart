import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

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

    return Scaffold(
      appBar: MainAppBar(
        title: "Login",
        elevation: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 100,
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
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.mark_email_read_outlined)),
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                const SmallText(text: 'Password'),
                const SizedBox(height: 4),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.lock_outline_rounded)),
                  controller: passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                const SizedBox(height: 20),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () async => authCubit.login(emailController.text, passwordController.text),
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
                      authCubit.loginWithGoogle();
                    } catch (e) {
                      return;
                    }
                  },
                  child: const LargeText(
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
                    onPressed: () => router.push(const SignUpRoute()),
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
