import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/modules/dio_module.dart';
import 'package:flutter_e_commerce/modules/directus_module.dart';
import 'package:flutter_e_commerce/repositorys/auth_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/repositorys/secure_storage_repository.dart';
import 'package:flutter_e_commerce/repositorys/user_data_repository.dart';

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
            recipesRepository: RecipesRepository(dio: DioModule()),
          )..fetchRecipeApi(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            secureStorageRepository: SecureStorageRepository(),
            authRepository: AuthRepository(
              dioModule: DioModule(),
              secureStorageRepository: SecureStorageRepository(),
            ),
          ),
        ),
        BlocProvider<UserDataCubit>(
          lazy: true,
          create: (context) => UserDataCubit(
            authRepository: AuthRepository(
              dioModule: DioModule(),
              secureStorageRepository: SecureStorageRepository(),
            ),
            userDataRepository: UserDataRepository(
              dioModule: DioModule(),
            ),
          )..getUserData(),
        )
      ],
      child: child,
    );
  }
}
