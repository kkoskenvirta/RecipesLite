import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/global/global_blocs.dart';
import 'package:flutter_e_commerce/global/global_repos.dart';
import 'package:flutter_e_commerce/global/listeners/auth_guard.dart';
import 'package:flutter_e_commerce/global/listeners/navigation_observer.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/views/login/login_page.dart';
import 'package:flutter_e_commerce/views/main/main_page.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  static final navigatorKey = GlobalKey<NavigatorState>();
  final AppRouter appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalRepos(
      child: GlobalBlocs(
        child: AuthGuard(
          router: appRouter,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: RecipeAppTheme().themeData,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
          ),
        ),
      ),
    );
  }
}
