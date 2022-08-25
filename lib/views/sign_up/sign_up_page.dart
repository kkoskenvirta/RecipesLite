import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

import '../../global/blocks/auth/cubit/auth_cubit.dart';
import '../../repositorys/auth_repository.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController(text: '');

    final emailController = TextEditingController(text: '');
    final passwordController = TextEditingController(text: '');
    final repeatPasswordController = TextEditingController(text: '');
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      appBar: MainAppBar(
        title: "Create an account",
        showBackButton: true,
        elevation: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: LargeText(
                      text: "🥘",
                      fontSize: FontSize.veryLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SmallText(text: 'Username (min 5 characters)'),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.person_outline_outlined)),
                    controller: usernameController,
                    textInputAction: TextInputAction.next,
                    validator: (value) => usernameController.text.length > 5 ? null : "Please enter a valid username",
                  ),
                  const SizedBox(height: 16),
                  SmallText(text: 'Email'),
                  const SizedBox(height: 4),
                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.mark_email_read_outlined)),
                    controller: emailController,
                    validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email address",
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  SmallText(text: 'Password'),
                  const SizedBox(height: 4),
                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.lock_outline_rounded)),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: passwordController,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  SmallText(text: 'Repeat password'),
                  const SizedBox(height: 4),
                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.lock_outline_rounded)),
                    controller: repeatPasswordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    validator: (value) =>
                        passwordController.text == repeatPasswordController.text ? null : "Passwords aren't matching",
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 20),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () async =>
                            authCubit.register('kkoskenvirta', 'kasper.koskenvirta@qalmari.fi', 'directustesti'),
                        child: state.inProgress
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : LargeText(
                                text: 'CONTINUE',
                                fontSize: FontSize.medium,
                                color: Colors.white,
                              ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        switch (state.error) {
                          case AuthError.emailTaken:
                            return const Text('The email address is already in use');

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
      ),
    );
  }
}