import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/navigation/navigation_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/user/user_model.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/views/profile/profile_recipe_view.dart';

import 'package:flutter_e_commerce/widgets/header/header.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  // final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: SingleChildScrollView(
            child: BlocBuilder<UserDataCubit, UserDataState>(builder: (context, state) {
              switch (state.status) {
                case UserDataStateStatus.loading:
                  return const CircularProgressIndicator();

                case UserDataStateStatus.loaded:
                  return ProfileBody(
                    profile: state.currUser!,
                  );

                default:
                  return const SizedBox();
              }
            }),
          ),
        )
      ]),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key, required this.profile}) : super(key: key);
  final UserModel profile;

  @override
  Widget build(BuildContext context) {
    final userDataCubit = BlocProvider.of<UserDataCubit>(context);
    final navigationCubit = BlocProvider.of<NavigationCubit>(context);
    final favorites = userDataCubit.state.favorites;
    final ownRecipes = userDataCubit.state.recipes;

    return BlocBuilder<NavigationCubit, NavigationState>(builder: (context, state) {
      if (state.navBarItem == NavBarItem.profile) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LargeText(
                  text: profile.firstName,
                  size: 22,
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 8,
                ),
                ListTile(
                  title: const Text(
                    "Favorites",
                    textScaleFactor: 0.9,
                  ),
                  tileColor: Colors.pink.shade50,
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: (() {
                    Get.toNamed(Routes.favorites.name, arguments: RecipeListArgs("Favorites", ListMode.favorites));
                  }),
                ),
                const SizedBox(
                  height: 8,
                ),
                ListTile(
                  title: const Text(
                    "Own recipes",
                    textScaleFactor: 0.9,
                  ),
                  tileColor: Colors.pink.shade50,
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: (() {
                    Get.toNamed(Routes.ownRecipes.name, arguments: RecipeListArgs("Own recipes", ListMode.owned));
                  }),
                ),
                const SizedBox(
                  height: 8,
                ),
                ListTile(
                  title: const Text(
                    "Settings",
                    textScaleFactor: 0.9,
                  ),
                  tileColor: Colors.pink.shade50,
                  trailing: const Icon(Icons.chevron_right_rounded),
                ),
              ],
            ),
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}
