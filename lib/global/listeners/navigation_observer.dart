import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';

class NavigationObserver extends AutoRouteObserver {
  NavigationObserver({
    // required this.navigatorKey,
    required this.context,
  });

  // final GlobalKey<NavigatorState> navigatorKey;
  final BuildContext context;
  @override
  void didPush(Route route, Route? previousRoute) {
    print(context);
    // final navigationCubit = BlocProvider.of<NavigationCubit>(context);

    // navigationCubit.setCurrentPath(route.settings.name);
  }
}
