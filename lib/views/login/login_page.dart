import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

import '../../global/blocks/auth/cubit/auth_cubit.dart';
import '../../repositorys/auth_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');
    final authCubit = BlocProvider.of<AuthCubit>(context);

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
                        child: state.maybeWhen(
                          uninitialized: (inProgress, authError) {
                            if (inProgress) {
                              return const CircularProgressIndicator(
                                color: Colors.white,
                              );
                            } else {
                              return LargeText(
                                text: 'LOGIN',
                                size: 16,
                                color: Colors.white,
                              );
                            }
                          },
                          orElse: () => const SizedBox(),
                        ));
                  },
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // ElevatedButton(
                //     //   onPressed: () => authCubit.login(emailController.value.text, passwordController.value.text),
                //     //   child: const Text('Login'),
                //     // ),
                //     // const SizedBox(width: 10),

                //   ],
                // ),
                const SizedBox(height: 20),
                Center(
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        uninitialized: (inProgress, error) {
                          if (error == AuthError.userNotExist) return const Text('Wrong email');
                          if (error == AuthError.invalidCredentials) return const Text('Wrong password');
                          if (error != null) return const Text('Something went wrong. Try again later.');
                          return const SizedBox();
                        },
                        orElse: () => const SizedBox(),
                      );
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
