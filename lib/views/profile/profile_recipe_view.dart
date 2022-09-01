import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/recipe_item.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

class ProfileRecipeView extends StatelessWidget {
  const ProfileRecipeView({
    Key? key,
    @PathParam('listMode') required this.listMode,
  })  : mode = listMode == "favorites" ? ListMode.favorites : ListMode.owned,
        title = listMode == "favorites" ? "Favorites" : "My recipes",
        super(key: key);

  final String listMode;
  final String title;
  final ListMode mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: title,
        showBackButton: true,
      ),
      body: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (context, state) {
          List<RecipeModel> recipes;
          recipes = mode == ListMode.favorites ? state.favorites : state.recipes;

          return SingleChildScrollView(
            child: ProfileRecipeViewBody(
              recipes: recipes,
              mode: mode,
            ),
          );
        },
      ),
    );
  }
}

class ProfileRecipeViewBody extends StatelessWidget {
  const ProfileRecipeViewBody({Key? key, required this.recipes, required this.mode}) : super(key: key);

  final ListMode mode;
  final List<RecipeModel> recipes;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<UserDataCubit, UserDataState>(
          builder: (context, state) {
            switch (state.status) {
              case UserDataStateStatus.initial:
                return const CircularProgressIndicator();
              case UserDataStateStatus.loading:
                return const CircularProgressIndicator();
              case UserDataStateStatus.loaded:
                final recipeList = recipes;

                List<RecipeModel> published = [];
                List<RecipeModel> pending = [];
                for (var recipe in recipeList) {
                  recipe.status == "draft" ? pending.add(recipe) : published.add(recipe);
                }
                if (mode == ListMode.owned) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0, bottom: 12.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: SmallText(text: "Pending for review", fontSize: FontSize.smallPlus)),
                            ),
                            ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 16,
                                );
                              },
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: pending.length,
                              itemBuilder: (context, index) {
                                return RecipeItem(
                                  recipe: pending[index],
                                );
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 18.0, bottom: 12.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: SmallText(
                                    text: "Published",
                                    fontSize: FontSize.smallPlus,
                                  )),
                            ),
                            ListView.separated(
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 16,
                                );
                              },
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: published.length,
                              itemBuilder: (context, index) {
                                return RecipeItem(
                                  recipe: published[index],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: recipeList.length,
                      itemBuilder: (context, index) {
                        return RecipeItem(
                          recipe: recipeList[index],
                        );
                      },
                    ),
                  );
                }

              default:
                return const Text("Error");
            }
          },
        )
      ],
    );
  }
}
