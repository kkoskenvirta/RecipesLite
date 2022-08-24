import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/category/categories_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/repositorys/auth_repository.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/repositorys/secure_storage_repository.dart';
import 'package:flutter_e_commerce/repositorys/user_data_repository.dart';
import 'package:flutter_e_commerce/views/single_category/cubit/single_category_cubit.dart';

import 'blocks/auth/cubit/auth_cubit.dart';

class GlobalBlocs extends StatelessWidget {
  final Widget child;
  const GlobalBlocs({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecipeFetchCubit>(
          create: (context) => RecipeFetchCubit(
            recipesRepository: context.read<RecipesRepository>(),
          )..fetchHomePageRecipes(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            secureStorageRepository: SecureStorageRepository(),
            authRepository: context.read<AuthRepository>(),
          ),
        ),
        BlocProvider<UserDataCubit>(
          lazy: false,
          create: (context) => UserDataCubit(
            recipesRepository: context.read<RecipesRepository>(),
            authRepository: context.read<AuthRepository>(),
            userDataRepository: context.read<UserDataRepository>(),
          )..getUserData(),
        ),
        BlocProvider<CategoriesCubit>(
          lazy: false,
          create: (context) => CategoriesCubit(
            categoriesRepository: context.read<CategoryRepository>(),
          )..getCategories(),
        ),
        BlocProvider<NavigationCubit>(
          lazy: false,
          create: (context) => NavigationCubit(),
        ),
        BlocProvider<SingleCategoryCubit>(
          lazy: true,
          create: (context) => SingleCategoryCubit(
            recipesRepository: context.read<RecipesRepository>(),
            categoryRepository: context.read<CategoryRepository>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
