import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/profile/cubit/profile_cubit.dart';

import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/modules/dio_module.dart';
import 'package:flutter_e_commerce/modules/directus_module.dart';
import 'package:flutter_e_commerce/repositorys/auth_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/views/home/cubit/recipe_search_cubit.dart';

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
            recipesRepository: RecipesRepository(directus: DirectusModule(), dio: DioModule()),
          )..fetchRecipeApi(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            authRepository: AuthRepository(dioModule: DioModule(), directus: DirectusModule()),
          ),
        ),
        BlocProvider<ProfileCubit>(
          lazy: true,
          create: (context) => ProfileCubit()..getCurrentUser(),
        )
      ],
      child: child,
    );
  }
}
