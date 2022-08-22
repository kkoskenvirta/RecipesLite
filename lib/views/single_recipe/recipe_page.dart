import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/ingredient_group/ingredient_group_model.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/int_extension.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/scale_func.dart';
import 'package:flutter_e_commerce/views/single_recipe/cubit/single_recipe_cubit.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/appbars/recipe_appbar.dart';
import 'package:flutter_e_commerce/widgets/blurhash_image.dart';
import 'package:flutter_e_commerce/widgets/categorization_bar.dart';
import 'package:flutter_e_commerce/widgets/ingredients_table.dart';
import 'package:flutter_e_commerce/widgets/information_bar.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

import '../../models/recipe/recipe_model.dart';
import '../../widgets/time_chip.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({
    Key? key,
    @PathParam('recipeId') required this.recipeId,
    this.recipe,
    this.heroTag,
  }) : super(key: key);
  final RecipeModel? recipe;
  final String recipeId;
  final UniqueKey? heroTag;
  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  ScrollController scrollController = ScrollController();
  Future<double> get _height => Future<double>.value(Dimensions.recipeImgSize);

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
      backgroundColor = RecipeAppTheme.colors.pinkLightLow;
    } else {
      message = "Removed from favorites";
      icon = const Icon(Icons.favorite_outline_rounded, size: 28);
      backgroundColor = RecipeAppTheme.colors.pinkLightLow;
    }
    Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      borderRadius: BorderRadius.circular(Dimensions.radius15),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 18),
      boxShadows: [
        BoxShadow(
          color: Colors.black12.withOpacity(0.05),
          spreadRadius: 2,
          blurRadius: 2,
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

  List<Widget> buildIngredientsTable(List<IngredientGroupModel> ingredientGroups) {
    List<Widget> widgets = [];

    for (var group in ingredientGroups) {
      widgets.add(LargeText(
        text: group.name!,
        size: 16,
      ));
      widgets.add(IngredientsTable(ingredients: group.ingredients));
      widgets.add(const SizedBox(
        height: 16,
      ));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    _scaleFactor = createScaling(_currScrollPosition);
    final loadedRecipe = widget.recipe;

    return BlocProvider(
      create: (context) =>
          SingleRecipeCubit(recipesRepository: context.read<RecipesRepository>())..initializeRecipe(loadedRecipe),
      child: Scaffold(
        appBar: RecipeAppBar(
          creator: loadedRecipe!.userCreated,
          transparent: true,
          showEditButton: true,
          loadedRecipe: loadedRecipe,
        ),
        extendBodyBehindAppBar: true,
        body: BlocBuilder<SingleRecipeCubit, SingleRecipeState>(
          builder: (context, state) {
            switch (state.status) {
              case SingleRecipeStateStatus.initial:
                return const CircularProgressIndicator();
              case SingleRecipeStateStatus.loading:
                return const CircularProgressIndicator();
              case SingleRecipeStateStatus.loaded:
                final recipe = state.recipe;

                return Stack(children: [
                  HeroImage(
                    scaleFactor: _scaleFactor,
                    recipe: recipe,
                    heroTag: widget.heroTag!,
                  ),
                  NotificationListener(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          AnimatedContainer(
                            curve: Curves.easeInCubic,
                            duration: const Duration(milliseconds: 200),
                            height: Dimensions.recipeImgSize,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: Dimensions.width15, horizontal: Dimensions.width20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (recipe!.name != null)
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            LargeText(
                                              text: recipe.name!,
                                              size: 22,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ],
                                        ),
                                      ),
                                    BlocBuilder<UserDataCubit, UserDataState>(
                                      builder: (context, state) {
                                        final userDataCubit = BlocProvider.of<UserDataCubit>(context);
                                        final result = state.favorites.where((favorite) => favorite.id == recipe.id);
                                        final bool favorited = result.isEmpty ? false : true;

                                        return Stack(
                                          children: [
                                            state.status == UserDataStateStatus.loaded
                                                ? Container(
                                                    padding: EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                      // color: RecipeAppTheme.colors.pinkLightLow,
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(Dimensions.radius15),
                                                      ),
                                                    ),
                                                    child: IconButton(
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
                                                            ),
                                                    ),
                                                  )
                                                : IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.favorite_border_rounded,
                                                      size: 30,
                                                    ),
                                                  ),
                                            // Positioned.fill(
                                            //   bottom: 2,
                                            //   child: Align(
                                            //     alignment: Alignment.bottomCenter,
                                            //     child: SmallText(
                                            //         text: favorited
                                            //             ? (int.parse(recipe.favoritesCount!) + 1).toString()
                                            //             : recipe.favoritesCount!),
                                            //   ),
                                            // )
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                if (recipe.difficulty != null && recipe.preparationTime != null)
                                  InformationBar(
                                    status: recipe.difficulty!,
                                    preparationTime: recipe.preparationTime!,
                                  ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                CategorizationBar(categories: recipe.categories, tags: recipe.tags),
                                const Divider(
                                  height: 24,
                                ),
                                // Align(
                                //   alignment: Alignment.centerLeft,
                                //   child: LargeText(
                                //     size: 16,
                                //     text: "Ingredients",
                                //   ),
                                // ),
                                if (recipe.ingredientGroups != null)
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: buildIngredientsTable(recipe.ingredientGroups!)),
                                const SizedBox(
                                  height: 12,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft, child: LargeText(size: 16, text: "Instructions")),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  recipe.instructions!,
                                ),
                                SizedBox(
                                  height: Dimensions.height45,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    onNotification: (notification) {
                      setState(() {
                        _currScrollPosition = scrollController.position.pixels;
                      });
                      return false;
                    },
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

class HeroImage extends StatelessWidget {
  const HeroImage({
    Key? key,
    required double scaleFactor,
    required this.recipe,
    required this.heroTag,
  })  : _scaleFactor = scaleFactor,
        super(key: key);

  final double _scaleFactor;
  final RecipeModel? recipe;
  final UniqueKey heroTag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: ClipRect(
        child: Transform.scale(
          scale: _scaleFactor,
          child: SizedBox(
            width: double.maxFinite,
            height: Dimensions.recipeImgSize,
            child: recipe!.picture != null
                ? BlurhashImage(
                    aspectRatio: 1.5,
                    blurhash: recipe!.blurhash,
                    image: recipe!.picture,
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
