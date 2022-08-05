import 'package:another_flushbar/flushbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/scale_func.dart';
import 'package:flutter_e_commerce/views/recipe_creator/recipe_creator.dart';
import 'package:flutter_e_commerce/views/single_recipe/cubit/single_recipe_cubit.dart';
import 'package:flutter_e_commerce/widgets/blurhash_image.dart';
import 'package:flutter_e_commerce/widgets/categorization_bar.dart';
import 'package:flutter_e_commerce/widgets/ingredients_table.dart';
import 'package:flutter_e_commerce/widgets/information_bar.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:get/get.dart';

import '../../config/api_config.dart';
import '../../models/recipe/recipe_model.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({
    Key? key,
  }) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  ScrollController scrollController = ScrollController();

  var _currScrollPosition = 0.0;
  double _scaleFactor = 0.85;
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _showToast(BuildContext context, bool favorited) {
    String message;
    Icon icon;
    Color backgroundColor;
    if (favorited) {
      message = "Added to favorites";
      icon = const Icon(Icons.favorite_rounded, size: 28);
      backgroundColor = Colors.pink.shade50;
    } else {
      message = "Removed from favorites";
      icon = const Icon(Icons.favorite_outline_rounded, size: 28);
      backgroundColor = Colors.pink.shade50;
    }
    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.circular(8),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 18),
      boxShadows: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.125),
          spreadRadius: 4,
          blurRadius: 4,
        )
      ],
      icon: icon,
      messageText: LargeText(
        text: message,
        size: 15,
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 1, milliseconds: 500),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    _scaleFactor = createScaling(_currScrollPosition);
    final loadedRecipe = Get.arguments;
    final currentUser = BlocProvider.of<UserDataCubit>(context).state.currUser;

    return Scaffold(
      body: BlocProvider(
        create: (context) => SingleRecipeCubit(
          recipesRepository: context.read<RecipesRepository>(),
        )..initializeRecipe(loadedRecipe),
        child: BlocBuilder<SingleRecipeCubit, SingleRecipeState>(
          builder: (context, state) {
            switch (state.status) {
              case SingleRecipeStateStatus.initial:
                return const CircularProgressIndicator();
              case SingleRecipeStateStatus.loading:
                return const CircularProgressIndicator();
              case SingleRecipeStateStatus.loaded:
                final recipe = state.recipe;

                return Stack(children: [
                  ClipRect(
                    child: Transform.scale(
                      scale: _scaleFactor,
                      child: SizedBox(
                        width: double.maxFinite,
                        height: Dimensions.recipeImgSize + 100,
                        child: recipe!.picture != null
                            ? BlurhashImage(
                                aspectRatio: 1.5,
                                blurhash: recipe.blurhash,
                                image: recipe.picture,
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                  NotificationListener(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(children: [
                        SizedBox(
                          height: Dimensions.recipeImgSize - 40,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: Dimensions.width15, horizontal: Dimensions.width20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: const Color.fromARGB(255, 252, 242, 246),
                          ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (recipe.name != null) LargeText(text: recipe.name!),
                                BlocBuilder<UserDataCubit, UserDataState>(builder: (context, state) {
                                  final userDataCubit = BlocProvider.of<UserDataCubit>(context);

                                  if (state.status == UserDataStateStatus.loaded) {
                                    final result = state.favorites.where((recipe) => recipe.id == recipe.id);
                                    final bool favorited = result.isEmpty ? false : true;

                                    return IconButton(
                                        onPressed: () {
                                          userDataCubit.toggleFavorites(recipe);
                                          _showToast(context, !favorited);
                                        },
                                        icon: favorited
                                            ? const Icon(
                                                Icons.favorite,
                                                size: 30,
                                              )
                                            : const Icon(
                                                Icons.favorite_border_rounded,
                                                size: 30,
                                              ));
                                  }
                                  return const SizedBox();
                                }),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            if (recipe.difficulty != null && recipe.preparationTime != null)
                              InformationBar(
                                status: recipe.difficulty!,
                                timeEstimate: recipe.preparationTime!,
                              ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            CategorizationBar(categories: recipe.categories, tags: recipe.tags),
                            const SizedBox(
                              height: 12,
                            ),
                            const Divider(
                              height: 1,
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: LargeText(
                                  size: 16,
                                  text: "Ingredients",
                                )),
                            ingredientsTable(ingredients: recipe.ingredients),
                            const Divider(
                              height: 1,
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            Align(alignment: Alignment.centerLeft, child: LargeText(size: 16, text: "Instructions")),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              recipe.instructions!,
                            ),
                            SizedBox(
                              height: Dimensions.height45,
                            ),
                          ]),
                        )
                      ]),
                    ),
                    onNotification: (notification) {
                      setState(() {
                        _currScrollPosition = scrollController.position.pixels;
                      });
                      return false;
                    },
                  ),
                  Positioned(
                    left: Dimensions.width20,
                    top: Dimensions.height45,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: const Color.fromARGB(255, 252, 242, 246),
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 10,
                              blurRadius: 10,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.chevron_left_rounded,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (currentUser?.id == recipe.userCreated)
                    Positioned(
                      right: Dimensions.width20,
                      top: Dimensions.height45,
                      child: GestureDetector(
                        onTap: () async {
                          final singleRecipeCubit = BlocProvider.of<SingleRecipeCubit>(context);
                          final RecipeModel? editedRecipe = await Get.toNamed<dynamic>(Routes.recipeEditor.name,
                              arguments: RecipeEditorArgs(
                                "Edit recipe",
                                recipe,
                              ));

                          if (editedRecipe != null) {
                            singleRecipeCubit.emitUpdatedRecipe(editedRecipe);
                          }
                        },
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: const Color.fromARGB(255, 252, 242, 246),
                            boxShadow: const [
                              BoxShadow(
                                spreadRadius: 10,
                                blurRadius: 10,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.edit,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                ]);
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
