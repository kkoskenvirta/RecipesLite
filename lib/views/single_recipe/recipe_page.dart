import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/modules/dio_module.dart';
import 'package:flutter_e_commerce/modules/directus_module.dart';
import 'package:flutter_e_commerce/repositorys/user_data_repository.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/scale_func.dart';
import 'package:flutter_e_commerce/widgets/categorization_bar.dart';
import 'package:flutter_e_commerce/widgets/incredients_table.dart';
import 'package:flutter_e_commerce/widgets/information_bar.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/ratings_bar.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/api_config.dart';
import '../../models/recipe/recipe_model.dart';

class RecipePage extends StatefulWidget {
  final RecipeModel recipe;

  const RecipePage({
    Key? key,
    required this.recipe,
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

  @override
  Widget build(BuildContext context) {
    _scaleFactor = createScaling(_currScrollPosition);
    final recipe = widget.recipe;

    return Scaffold(
      body: Stack(children: [
        ClipRect(
          child: Transform.scale(
            scale: _scaleFactor,
            child: SizedBox(
              width: double.maxFinite,
              height: Dimensions.recipeImgSize + 100,
              child: CachedNetworkImage(
                height: Dimensions.listViewImgSize,
                width: Dimensions.listViewImgSize,
                imageUrl: '$baseUrl$assetsPath${widget.recipe.picture}',
                imageBuilder: (context, imageProvider) => Container(
                  height: Dimensions.listViewImgSize,
                  width: Dimensions.listViewImgSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: CircularProgressIndicator(value: downloadProgress.progress),
                ),
              ),
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
                padding: EdgeInsets.symmetric(vertical: Dimensions.width20, horizontal: Dimensions.width20),
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
                              },
                              icon: favorited ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_rounded));
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
                  CategorizationBar(categories: recipe.categories!, tags: recipe.tags!),
                  const SizedBox(
                    height: 12,
                  ),
                  Divider(
                    height: 1,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: LargeText(
                        size: 16,
                        text: "Incredients",
                      )),
                  IncredientsTable(incredients: recipe.incredients!),
                  Divider(
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
                child: Icon(Icons.chevron_left_rounded),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
