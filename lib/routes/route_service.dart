import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/views/home/home_page.dart';
import 'package:flutter_e_commerce/views/login/login_page.dart';
import 'package:flutter_e_commerce/views/profile/profile_page.dart';
import 'package:flutter_e_commerce/views/recipe/recipe_page.dart';

enum Routes {
  login('/'),
  recipe('/home/recipe'),
  home('/home'),
  profile('/profile');

  const Routes(this.name);
  final String name;
}

class RouterService {
  RouterService._internal();
  static final _singleton = RouterService._internal();
  factory RouterService() => _singleton;

  navigate(RouteSettings settings) {
    final route =
        Routes.values.firstWhere((route) => route.name == settings.name);
    switch (route) {
      case Routes.login:
        return const LoginPage();
      case Routes.recipe:
        final recipeData = settings.arguments as RecipeModel;
        return RecipePage(recipeModel: recipeData);
      case Routes.home:
        return const HomePage();
      case Routes.profile:
        // final profileData = settings.arguments as ProfileModel;
        return ProfilePage();
    }
  }
}
