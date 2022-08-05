import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({
    required this.child,
    required this.navigator,
    required this.router,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final GlobalKey<NavigatorState> navigator;
  final AppRouter router;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        print(state);
        state.maybeWhen(
          authenticated: () => router.pushNamed(Routes.main.name),
          unauthenticated: () {
            router.popUntilRouteWithName(Routes.login.name);
            context.read<AuthCubit>().updateState(const AuthState.uninitialized(inProgress: false));
          },
          orElse: () {},
        );
      },
      child: child,
    );
  }
}
