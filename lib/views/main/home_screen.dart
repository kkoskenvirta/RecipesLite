import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/blurhash_image.dart';
import 'package:flutter_e_commerce/widgets/food_page_popular_item.dart';
import 'package:flutter_e_commerce/widgets/information_bar.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/recipe_item.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
  double _scaleFactor = 0.85;
  double _height = 220;

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
    final router = AutoRouter.of(context);
    //Home view horizontal slider
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<RecipeFetchCubit, RecipeFetchState>(
        builder: (context, state) {
          switch (state.status) {
            case RecipeFetchStateStatus.initial:
              return const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            case RecipeFetchStateStatus.loading:
              return const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            case RecipeFetchStateStatus.error:
              return const Text("Error happened");
            case RecipeFetchStateStatus.loaded:
              final featuredList = state.featured;
              final popularList = state.popular;
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
                            itemCount: featuredList.length,
                            itemBuilder: (context, index) {
                              RecipeModel featured = featuredList[index];
                              return _buildPageItem(index, featured);
                            },
                          )
                        : const SizedBox(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (featuredList.length > 0)
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
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [LargeText(text: "Popular recipes"), SmallText(text: "SHOW ALL")],
                    ),
                  ),
                  Padding(
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
                        final RecipeModel recipe = popularList[index];
                        return RecipeItem(
                          title: recipe.name!,
                          difficulty: recipe.difficulty!,
                          description: recipe.shortDescription!,
                          timeEstimate: recipe.preparationTime!,
                          imageUrl: recipe.picture,
                          blurhash: recipe.blurhash,
                          categories: recipe.categories!,
                          tags: recipe.tags!,
                          onTap: () {
                            router.push(RecipeRoute(recipe: recipe, recipeId: recipe.id!));
                          },
                        );
                      },
                    ),
                  )
                ],
              );
            default:
              return const Text("error");
          }
        },
      ),
    );
  }

  Widget _buildPageItem(int index, RecipeModel recipe) {
    //Mathematics for the scaling effect on slides
    createScalingMatrix() {
      Matrix4 matrix = new Matrix4.identity();
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

    // Slide item
    return GestureDetector(
      onTap: () {
        router.push(RecipeRoute(recipe: recipe, recipeId: recipe.id!));
      },
      child: Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.pink.shade200,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.025),
                    spreadRadius: 10,
                    blurRadius: 13,
                  )
                ],
              ),
              child: BlurhashImage(
                aspectRatio: 1.6,
                image: recipe.picture,
                blurhash: recipe.blurhash,
                height: Dimensions.pageViewContainer,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    spreadRadius: 10,
                    blurRadius: 13,
                  )
                ],
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LargeText(text: recipe.name!),
                            SizedBox(height: Dimensions.height10),
                            SmallText(text: recipe.shortDescription!),
                            // const RatingsRow(ratingScore: 4.5, commentCount: 1245),
                            SizedBox(
                              height: Dimensions.height15,
                            ),
                            const InformationBar(
                              status: "Normal",
                              timeEstimate: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
