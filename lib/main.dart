import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/global/global_blocs.dart';
import 'package:flutter_e_commerce/global/global_repos.dart';
import 'package:flutter_e_commerce/global/listeners/auth_guard.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  static final navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalRepos(
      child: GlobalBlocs(
        child: AuthGuard(
          navigator: navigatorKey,
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: RecipeAppTheme().themeData,
            navigatorKey: navigatorKey,
            initialRoute: Routes.login.name,
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: ((context) => RouterService().navigate(settings)),
              );
            },
          ),
        ),
      ),
    );
  }
}
