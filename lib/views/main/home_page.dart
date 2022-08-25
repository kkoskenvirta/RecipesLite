import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/blurhash_image.dart';
import 'package:flutter_e_commerce/widgets/information_bar.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/recipe_item.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/widgets/tag_list.dart';
import 'package:skeletons/skeletons.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Home",
        showSearchButton: true,
        showCreateButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HomePageBody(),
          ],
        ),
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);

  var _currPageValue = 0.0;
  final double _scaleFactor = 0.85;
  final double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<RecipeFetchCubit, RecipeFetchState>(
          builder: (context, state) {
            final featuredList = state.featured;

            switch (state.featuredStatus) {
              case RecipeFetchStateStatus.initial:
                return const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              case RecipeFetchStateStatus.loading:
                return _FeaturedItemsLoading(currPageValue: _currPageValue);
              case RecipeFetchStateStatus.error:
                return const Text("Error happened");
              case RecipeFetchStateStatus.loaded:
                return _featuredItemsLoaded(featuredList);
            }
          },
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LargeText(
                text: "Popular recipes",
                fontSize: FontSize.large,
              ),
              TextButton(
                onPressed: () {
                  context.router.push(const RecipeListRoute());
                },
                child: SmallText(
                  text: "SHOW ALL",
                  color: RecipeAppTheme.colors.pinkAccent,
                ),
              )
            ],
          ),
        ),
        BlocBuilder<RecipeFetchCubit, RecipeFetchState>(
          builder: (context, state) {
            final popularList = state.popular;
            switch (state.popularStatus) {
              case RecipeFetchStateStatus.initial:
                return const RecipeItemListSkeleton();
              case RecipeFetchStateStatus.loading:
                return const RecipeItemListSkeleton();
              case RecipeFetchStateStatus.error:
                return const Text("Error happened");
              case RecipeFetchStateStatus.loaded:
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
                    itemCount: popularList.length,
                    itemBuilder: (context, index) {
                      return RecipeItem(
                        recipe: popularList[index],
                      );
                    },
                  ),
                );
            }
          },
        )
      ],
    );
  }

  Column _featuredItemsLoaded(List<RecipeModel> featuredList) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          clipBehavior: Clip.none,
          height: Dimensions.pageView,

          //Build the slides for the slider
          child: featuredList.isNotEmpty
              ? PageView.builder(
                  clipBehavior: Clip.none,
                  controller: pageController,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    RecipeModel featured = featuredList[index];
                    return _featuredRecipeItem(index, featured);
                  },
                )
              : const SizedBox(),
        ),
        const SizedBox(
          height: 10,
        ),
        if (featuredList.isNotEmpty)
          DotsIndicator(
            dotsCount: featuredList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: Colors.pink.shade300,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
      ],
    );
  }

  Widget _featuredRecipeItem(int index, RecipeModel recipe) {
    //Mathematics for the scaling effect on slides
    createScalingMatrix() {
      Matrix4 matrix = Matrix4.identity();
      if (index == _currPageValue.floor()) {
        var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      } else if (index == _currPageValue.floor() + 1) {
        var currScale = _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      } else if (index == _currPageValue.floor() - 1) {
        var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
      } else {
        var currScale = _scaleFactor;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, (_height * (1 - _scaleFactor) / 2), 1);
      }
      return matrix;
    }

    Matrix4 matrix = createScalingMatrix();
    final router = AutoRouter.of(context);
    final UniqueKey heroTag = UniqueKey();
    // Slide item
    return GestureDetector(
      onTap: () {
        router.push(RecipeRoute(recipe: recipe, recipeId: recipe.id!, heroTag: heroTag));
      },
      child: Transform(
        transform: matrix,
        child: Hero(
          tag: heroTag,
          child: Material(
            child: Stack(
              children: [
                Container(
                  height: Dimensions.pageViewContainer,
                  margin:
                      EdgeInsets.only(bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    boxShadow: [RecipeAppTheme.shadows.normal],
                  ),
                  child: BlurhashImage(
                    aspectRatio: 1.6,
                    image: recipe.picture,
                    blurhash: recipe.blurhash,
                    height: Dimensions.pageViewContainer,
                    boxShadow: [RecipeAppTheme.shadows.normal],
                  ),
                ),
                Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Dimensions.width15),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white,
                              boxShadow: [RecipeAppTheme.shadows.normal]),
                          child: Container(
                            padding: EdgeInsets.only(
                                top: Dimensions.height10,
                                bottom: Dimensions.height10,
                                left: Dimensions.width15,
                                right: Dimensions.width15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TagList(categories: recipe.categories!, tags: recipe.tags!, tagFilters: const []),
                                const SizedBox(height: 8),
                                LargeText(
                                  text: recipe.name!,
                                  fontSize: FontSize.large,
                                ),
                                const SizedBox(height: 8),
                                SmallText(text: recipe.shortDescription!),
                                SizedBox(
                                  height: Dimensions.height15,
                                ),
                                InformationBar(
                                  status: recipe.difficulty!,
                                  preparationTime: recipe.preparationTime!,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeaturedItemsLoading extends StatelessWidget {
  const _FeaturedItemsLoading({
    required double currPageValue,
  }) : _currPageValue = currPageValue;

  final double _currPageValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
          clipBehavior: Clip.none,
          height: Dimensions.pageView,

          //Build the slides for the slider
          child: const FeaturedItemSkeleton(),
        ),
        const SizedBox(
          height: 10,
        ),
        DotsIndicator(
          dotsCount: 1,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: Colors.pink.shade300,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }
}

class FeaturedItemSkeleton extends StatelessWidget {
  const FeaturedItemSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            boxShadow: [RecipeAppTheme.shadows.normal],
          ),
          child: SkeletonAvatar(
            style: SkeletonAvatarStyle(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              width: double.infinity,
              minHeight: MediaQuery.of(context).size.height / 8,
              maxHeight: MediaQuery.of(context).size.height / 3,
            ),
          ),
        ),
        Column(
          children: [
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.width15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.025),
                          spreadRadius: 10,
                          blurRadius: 26,
                        ),
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height10,
                        bottom: Dimensions.height10,
                        left: Dimensions.width15,
                        right: Dimensions.width15),
                    child: SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                        padding: const EdgeInsets.only(bottom: 8, top: 8, left: 4, right: 8),
                        lines: 4,
                        spacing: 12,
                        lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          height: 22,
                          borderRadius: BorderRadius.circular(8),
                          minLength: MediaQuery.of(context).size.width / 3,
                          maxLength: MediaQuery.of(context).size.width / 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
