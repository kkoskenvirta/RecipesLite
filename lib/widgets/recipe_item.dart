import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/int_extension.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/widgets/blurhash_image.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';
import 'package:flutter_e_commerce/widgets/tag_chip.dart';
import 'package:flutter_e_commerce/widgets/tag_list.dart';
import 'package:flutter_e_commerce/widgets/time_chip.dart';

import '../models/recipe/recipe_model.dart';

class RecipeItem extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeItem({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List categoryList = recipe.categories!.isNotEmpty ? Set.from(recipe.categories!).toList() : [];
    final List tagList = recipe.tags!.isNotEmpty ? Set.from(recipe.tags!).toList() : [];
    final router = AutoRouter.of(context);
    final UniqueKey heroTag = UniqueKey();
    return GestureDetector(
      onTap: () {
        router.push(RecipeRoute(recipe: recipe, recipeId: recipe.id!, heroTag: heroTag));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
            ),
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius15),
        ),
        height: Dimensions.listViewImgSize,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: heroTag,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                child: Stack(
                  children: [
                    BlurhashImage(
                      aspectRatio: 1,
                      image: recipe.picture,
                      blurhash: recipe.blurhash!,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: TimeChip(
                        size: 12,
                        text: recipe.preparationTime!.parseToTimeString(),
                        horizontal: 8,
                        vertical: 7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TagList(categories: recipe.categories!, tags: recipe.tags!),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: LargeText(
                        text: recipe.name!,
                        overFlow: TextOverflow.ellipsis,
                        size: 18,
                      ),
                    ),
                    const SizedBox(height: 3),
                    SmallText(text: recipe.shortDescription!),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
