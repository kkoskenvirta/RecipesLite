import 'package:auto_route/auto_route.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/utils/custom_transitions.dart';
import 'package:flutter_e_commerce/views/login/login_page.dart';
import 'package:flutter_e_commerce/views/categories/categories_page.dart';
import 'package:flutter_e_commerce/views/main/home_page.dart';
import 'package:flutter_e_commerce/views/main/main_page.dart';
import 'package:flutter_e_commerce/views/profile/profile_recipe_view.dart';
import 'package:flutter_e_commerce/views/profile/profile_page.dart';
import 'package:flutter_e_commerce/views/recipe_creator/recipe_creator.dart';
import 'package:flutter_e_commerce/views/recipe_list/recipe_list_page.dart';
import 'package:flutter_e_commerce/views/sign_up/sign_up_page.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';

@MaterialAutoRouter(
  routes: [
    CupertinoRoute(
      page: LoginPage,
      path: '/login',
      initial: true,
    ),
    CupertinoRoute(
      page: SignUpPage,
      path: '/sign-up',
    ),
    AutoRoute(page: MainPage, path: '/main', children: [
      CupertinoRoute(
        name: "HomeRouter",
        page: EmptyRouterPage,
        path: 'home',
        children: [
          CupertinoRoute(path: '', page: HomePage, maintainState: true),
          CupertinoRoute(
            path: 'browse',
            page: RecipeListPage,
          ),
        ],
      ),
      CupertinoRoute(
        name: "CategoriesRouter",
        page: EmptyRouterPage,
        path: 'categories',
        children: [
          CupertinoRoute(
            path: '',
            page: CategoriesPage,
          ),
          CupertinoRoute(
            name: "CategoryRoute",
            page: RecipeListPage,
          ),
        ],
      ),
      CupertinoRoute(
        name: "SearchRouter",
        page: EmptyRouterPage,
        path: 'search',
        children: [
          CupertinoRoute(
            path: '',
            name: "SearchRoute",
            page: RecipeListPage,
          ),
        ],
      ),
      CupertinoRoute(
        name: "ProfileRouter",
        page: EmptyRouterPage,
        path: 'profile',
        children: [
          CupertinoRoute(
            path: '',
            page: ProfilePage,
          ),
          CupertinoRoute(
            name: "FavoritesRoute",
            path: ':listMode',
            page: ProfileRecipeView,
          ),
          CupertinoRoute(
            name: "OwnedRoute",
            path: ':listMode',
            page: ProfileRecipeView,
          ),
        ],
      ),
    ]),
    CupertinoRoute(
      path: '/recipes/:recipeId',
      page: RecipePage,
    ),
    CupertinoRoute<RecipeModel>(
      name: "RecipeCreator",
      page: RecipeCreatorScreen,
      path: '/recipe-creator',
    ),
    CupertinoRoute<RecipeModel>(
      name: "RecipeEditor",
      page: RecipeCreatorScreen,
      path: '/recipe-editor',
    ),
    // CupertinoRoute(
    //   page: SearchPage,
    //   path: '/search',
    //   transitionsBuilder: CustomTransitions.slideLeftWithFade,
    // ),
  ],
  replaceInRouteName: 'Page,Route',
)
class $AppRouter {}
