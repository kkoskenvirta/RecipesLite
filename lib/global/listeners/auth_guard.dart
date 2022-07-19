import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({
    required this.child,
    required this.navigator,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final GlobalKey<NavigatorState> navigator;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        print(state);
        state.maybeWhen(
          authenticated: () => navigator.currentState?.pushNamedAndRemoveUntil(Routes.main.name, (route) => false),
          unauthenticated: () {
            navigator.currentState?.pushNamedAndRemoveUntil(Routes.login.name, (route) => false);
            context.read<AuthCubit>().updateState(const AuthState.uninitialized(inProgress: false));
          },
          orElse: () {},
        );
      },
      child: child,
    );
  }
}
