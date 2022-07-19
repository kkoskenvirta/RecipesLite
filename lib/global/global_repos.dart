import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_e_commerce/modules/dio_module.dart';
import 'package:flutter_e_commerce/modules/directus_module.dart';
import 'package:flutter_e_commerce/repositorys/auth_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/repositorys/secure_storage_repository.dart';
import 'package:flutter_e_commerce/repositorys/user_data_repository.dart';

class GlobalRepos extends StatelessWidget {
  final Widget child;
  const GlobalRepos({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<AuthRepository>(
        create: (context) => AuthRepository(
          secureStorageRepository: SecureStorageRepository(),
          dioModule: DioModule(),
        ),
      ),
      RepositoryProvider<RecipesRepository>(
        create: (context) => RecipesRepository(
          dio: DioModule(),
        ),
      ),
      RepositoryProvider<UserDataRepository>(
        create: (context) => UserDataRepository(
          dioModule: DioModule(),
        ),
      ),
      RepositoryProvider<SecureStorageRepository>(create: (context) => SecureStorageRepository())
    ], child: child);
  }
}
