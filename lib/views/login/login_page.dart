import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  // child: Image.asset(''),
                ),
                Align(
                  alignment: Alignment.center,
                  child: LargeText(
                    text: "🥘",
                    size: 26,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.center,
                  child: LargeText(
                    text: "Register or sign in",
                    size: 26,
                  ),
                ),
                const SizedBox(height: 20),
                SmallText(text: 'Email'),
                const SizedBox(height: 4),
                TextField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                SmallText(text: 'Password'),
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
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () async => authCubit.login('kazu.kozu@hotmail.com', 'directustesti'),
                      child: state.inProgress
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : LargeText(
                              text: 'LOGIN',
                              size: 16,
                              color: Colors.white,
                            ),
                    );
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                // SignInButton(
                //   elevation: 0,
                //   Buttons.Google,
                //   onPressed: () async => authCubit.loginWithProvider('google'),
                // ),
                ElevatedButton.icon(
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // NEW
                    backgroundColor: RecipeAppTheme.colors.blueAccent,
                  ),
                  onPressed: () async => authCubit.loginWithProvider('google'),
                  label: LargeText(
                    text: 'LOGIN WITH GOOGLE',
                    size: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SmallText(
                    text: "or",
                    size: 14,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => router.navigate(const RegisterRoute()),
                    child: const Text(
                      "Create an account",
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
                          return SizedBox();
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
