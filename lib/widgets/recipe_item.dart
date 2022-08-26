import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/int_extension.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/blurhash_image.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';
import 'package:flutter_e_commerce/widgets/tag_list.dart';
import 'package:flutter_e_commerce/widgets/time_chip.dart';
import 'package:skeletons/skeletons.dart';

import '../models/recipe/recipe_model.dart';

class RecipeItem extends StatelessWidget {
  final RecipeModel recipe;
  final List<TagModel>? tagFilters;
  const RecipeItem({
    Key? key,
    required this.recipe,
    this.tagFilters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);
    final UniqueKey heroTag = UniqueKey();
    return GestureDetector(
      onTap: () {
        router.push(RecipeRoute(recipe: recipe, recipeId: recipe.id!, heroTag: heroTag));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [RecipeAppTheme.shadows.normal],
          borderRadius: BorderRadius.circular(Dimensions.radius15),
        ),
        height: Dimensions.listViewImgSize,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
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
                    left: 3,
                    top: 3,
                    child: TimeChip(
                      fontSize: FontSize.small,
                      text: recipe.preparationTime!.parseToTimeString(),
                      horizontal: 8,
                      vertical: 7,
                      rounded: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: LargeText(
                          text: recipe.name!,
                          overFlow: TextOverflow.ellipsis,
                          fontSize: FontSize.mediumPlus,
                        ),
                      ),
                      const SizedBox(height: 4),
                      SmallText(text: recipe.shortDescription!),
                      const SizedBox(height: 8),
                      TagList(categories: recipe.categories!, tags: recipe.tags!, tagFilters: tagFilters ?? []),
                    ],
                  ),
                  Positioned(
                    right: 2,
                    top: 2,
                    child: BlocBuilder<UserDataCubit, UserDataState>(
                      builder: (context, state) {
                        final userDataCubit = BlocProvider.of<UserDataCubit>(context);
                        if (state.status == UserDataStateStatus.loaded) {
                          final result = state.favorites.where((favorite) => favorite.id == recipe.id);
                          final bool favorited = result.isEmpty ? false : true;

                          return IconButton(
                              onPressed: () {
                                userDataCubit.toggleFavorites(recipe);
                              },
                              icon: favorited
                                  ? const Icon(
                                      Icons.favorite,
                                      size: 24,
                                    )
                                  : const Icon(
                                      Icons.favorite_border_rounded,
                                      size: 24,
                                    ));
                        }
                        return IconButton(
                            icon: const Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.transparent,
                              size: 30,
                            ),
                            onPressed: () {
                              return;
                            });
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeItemSkeleton extends StatelessWidget {
  const RecipeItemSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [RecipeAppTheme.shadows.normal],
        borderRadius: BorderRadius.circular(Dimensions.radius15),
      ),
      height: Dimensions.listViewImgSize,
      child: SkeletonItem(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                width: Dimensions.listViewImgSize,
                height: Dimensions.listViewImgSize,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SkeletonParagraph(
                style: SkeletonParagraphStyle(
                  padding: const EdgeInsets.only(top: 26, left: 8, right: 16),
                  lines: 3,
                  spacing: 8,
                  lineStyle: SkeletonLineStyle(
                    randomLength: true,
                    height: 16,
                    borderRadius: BorderRadius.circular(8),
                    minLength: MediaQuery.of(context).size.width / 3,
                    maxLength: MediaQuery.of(context).size.width / 1.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RecipeItemListSkeleton extends StatelessWidget {
  const RecipeItemListSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.width15),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 14,
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const RecipeItemSkeleton();
        },
      ),
    );
  }
}
