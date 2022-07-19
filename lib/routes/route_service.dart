import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/views/login/login_page.dart';
import 'package:flutter_e_commerce/views/main/main_page.dart';
import 'package:flutter_e_commerce/views/profile/profile_page.dart';
import 'package:flutter_e_commerce/views/recipe_list/single_category_page.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';

enum Routes {
  login('/'),
  recipe('/main/recipe'),
  main('/main'),
  profile('/profile'),
  category('/main/category');

  const Routes(this.name);
  final String name;
}

class RouterService {
  RouterService._internal();
  static final _singleton = RouterService._internal();
  factory RouterService() => _singleton;

  navigate(RouteSettings settings) {
    final route = Routes.values.firstWhere((route) => route.name == settings.name);
    switch (route) {
      case Routes.login:
        return const LoginPage();
      case Routes.recipe:
        final recipeData = settings.arguments as RecipeModel;
        return RecipePage(recipeModel: recipeData);
      case Routes.main:
        return const MainPage();
      case Routes.profile:
        // final profileData = settings.arguments as ProfileModel;
        return ProfilePage();
      case Routes.category:
        final category = settings.arguments as CategoryModel;
        return SingleCategoryScreen(category: category);
    }
  }
}
