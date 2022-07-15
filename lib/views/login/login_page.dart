import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email'),
              TextField(controller: emailController),
              const SizedBox(height: 10),
              Text('Password'),
              TextField(controller: passwordController),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => authCubit.login(
                    emailController.value.text, passwordController.value.text),
                child: const Text('Login'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async =>
                    authCubit.login('kasukosu96@gmail.com', 'directustesti'),
                child: const Text('Quick'),
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    uninitialized: (inProgress, error) {
                      if (inProgress) return CircularProgressIndicator();
                      if (error == AuthError.userNotExist)
                        return const Text('Wrong email');
                      if (error == AuthError.invalidCredentials)
                        return const Text('Wrong password');
                      if (error != null)
                        return const Text(
                            'Something went wrong. Try again later.');
                      return const Text('Please sign in :)');
                    },
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
