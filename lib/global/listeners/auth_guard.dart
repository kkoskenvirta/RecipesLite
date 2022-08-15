import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({
    required this.child,
    required this.router,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final AppRouter router;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        print(state);
        state.maybeWhen(
          authenticated: () => router.replace(const MainRoute()),
          unauthenticated: () {
            router.replace(const LoginRoute());
            context.read<AuthCubit>().updateState(const AuthState.uninitialized(inProgress: false));
          },
          orElse: () {},
        );
      },
      child: child,
    );
  }
}
