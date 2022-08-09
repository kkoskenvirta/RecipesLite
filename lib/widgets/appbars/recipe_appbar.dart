import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/views/single_recipe/cubit/single_recipe_cubit.dart';

class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBar({
    Key? key,
    this.transparent = false,
    this.creator,
    this.editRecipe,
    this.showLogoutButton = false,
    this.showSearchButton = false,
    this.showBackButton = false,
    this.showEditButton = false,
    this.showCreateButton = false,
    this.loadedRecipe,
  })  : preferredSize = const Size.fromHeight(44),
        super(key: key);

  final bool transparent;

  final String? creator;
  final VoidCallback? editRecipe;
  final RecipeModel? loadedRecipe;

  final bool showLogoutButton;
  final bool showSearchButton;
  final bool showBackButton;
  final bool showEditButton;
  final bool showCreateButton;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final currentUser = BlocProvider.of<UserDataCubit>(context).state.currUser;
    final permission = creator == currentUser?.id ? true : false;
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final router = AutoRouter.of(context);

    return BlocBuilder<SingleRecipeCubit, SingleRecipeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AppBar(
            backgroundColor: transparent ? Colors.transparent : null,
            shadowColor: transparent ? Colors.transparent : null,
            elevation: transparent ? 0 : null,
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Palette.pToLight.shade300,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            actions: [
              if (showEditButton && permission)
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () async {
                      final singleRecipeCubit = BlocProvider.of<SingleRecipeCubit>(context);
                      final RecipeModel? editedRecipe = await router.push<dynamic>(
                        RecipeEditor(
                          title: "Edit recipe",
                          editableRecipe: loadedRecipe,
                        ),
                      );
                      if (editedRecipe != null) {
                        singleRecipeCubit.emitUpdatedRecipe(editedRecipe);
                      }
                    },
                    icon: const Icon(Icons.edit),
                    color: Palette.pToLight.shade300,
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
