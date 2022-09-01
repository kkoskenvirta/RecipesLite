import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/scale_func.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/views/single_recipe/cubit/single_recipe_cubit.dart';
import 'package:flutter_e_commerce/widgets/appbars/recipe_appbar.dart';
import 'package:flutter_e_commerce/widgets/blurhash_image.dart';
import 'package:flutter_e_commerce/widgets/categorization_bar.dart';
import 'package:flutter_e_commerce/widgets/custom_toast.dart';
import 'package:flutter_e_commerce/widgets/ingredients_table.dart';
import 'package:flutter_e_commerce/widgets/information_bar.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/typography/content_text.dart';
import '../../models/recipe/recipe_model.dart';

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

class _RecipePageState extends State<RecipePage> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();

  var _animateHeight = Dimensions.recipeImgSize + 0;
  var _currScrollPosition = 0.0;
  double _scaleFactor = 0.85;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 50)).then(
      (value) => setState(() {
        _animateHeight = Dimensions.recipeImgSize - 40;
      }),
    );
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
                            // curve: Curves.easeInOutSine,
                            curve: Curves.easeInOutSine,
                            duration: const Duration(milliseconds: 500),
                            height: _animateHeight,
                            // height: Dimensions.recipeImgSize,
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
                                              fontSize: FontSize.veryLarge,
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
                                                    padding: const EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                      // color: RecipeAppTheme.colors.pinkLightLow,
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(Dimensions.radius15),
                                                      ),
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        userDataCubit.toggleFavorites(recipe);
                                                        // _showToast(context, !favorited);
                                                        if (!favorited == true) {
                                                          const CustomToast().showToast(
                                                            context: context,
                                                            message: "Added to favorites",
                                                            icon: const Icon(Icons.favorite_rounded, size: 28),
                                                          );
                                                        } else {
                                                          const CustomToast().showToast(
                                                            context: context,
                                                            message: "Removed from favorites",
                                                            icon: const Icon(Icons.favorite_outline_rounded, size: 28),
                                                          );
                                                        }
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
                                if (recipe.ingredientGroups != null)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: buildIngredientsTable(recipe.ingredientGroups!),
                                  ),
                                const SizedBox(
                                  height: 12,
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: LargeText(fontSize: FontSize.mediumPlus, text: "Instructions"),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                ContentText(
                                  text: recipe.instructions!,
                                  fontSize: FontSize.smallPlus,
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
