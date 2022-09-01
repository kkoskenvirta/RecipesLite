import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/views/single_recipe/cubit/single_recipe_cubit.dart';

class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  RecipeAppBar({
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
  })  : preferredSize = const Size.fromHeight(60),
        super(key: key);

  final bool transparent;

  final String? creator;
  final VoidCallback? editRecipe;
  RecipeModel? loadedRecipe;

  final bool showLogoutButton;
  final bool showSearchButton;
  final bool showBackButton;
  final bool showEditButton;
  final bool showCreateButton;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final currentUser = BlocProvider.of<UserDataCubit>(context).state.userData;
    final permission = creator == currentUser?.userId ? true : false;
    final router = AutoRouter.of(context);

    return BlocBuilder<SingleRecipeCubit, SingleRecipeState>(
      builder: (context, state) {
        loadedRecipe = state.recipe;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: AppBar(
            backgroundColor: transparent ? Colors.transparent : null,
            shadowColor: transparent ? Colors.transparent : null,
            elevation: transparent ? 0 : null,
            leading: Material(
              elevation: 4,
              child: IconButton(
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: RecipeAppTheme.colors.pinkAccent,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            actions: [
              if (showEditButton && permission)
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [RecipeAppTheme.shadows.normal]),
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
                    icon: Icon(
                      Icons.edit,
                      color: RecipeAppTheme.colors.pinkAccent,
                    ),
                    color: RecipeAppTheme.colors.pinkMedium,
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
