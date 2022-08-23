import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/global/global_blocs.dart';
import 'package:flutter_e_commerce/global/global_repos.dart';
import 'package:flutter_e_commerce/global/listeners/auth_guard.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugRepaintRainbowEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  static final navigatorKey = GlobalKey<NavigatorState>();
  final AppRouter appRouter = AppRouter();
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    // PaintingBinding.instance.imageCache.maximumSizeBytes = 1000 << 20;

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
