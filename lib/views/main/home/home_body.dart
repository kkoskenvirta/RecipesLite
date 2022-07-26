import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/single_recipe/recipe_page.dart';
import 'package:flutter_e_commerce/widgets/food_page_popular_item.dart';
import 'package:flutter_e_commerce/widgets/information_bar.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/ratings_bar.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';

class HomePageBody extends StatefulWidget {
  HomePageBody({Key? key}) : super(key: key);

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
    //Home view horizontal slider
    return BlocBuilder<RecipeFetchCubit, RecipeFetchState>(
      builder: (context, state) {
        if (state is RecipeFetchInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RecipeFetchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RecipeFetchError) {
          return const Text("Error happened");
        } else if (state is RecipeFetchLoaded) {
          final recipeList = state.recipeList;
          return Column(
            children: [
              Container(
                clipBehavior: Clip.none,
                height: Dimensions.pageView,

                //Build the slides for the slider
                child: PageView.builder(
                    clipBehavior: Clip.none,
                    controller: pageController,
                    itemCount: 5,
                    itemBuilder: (context, position) {
                      return _buildPageItem(position);
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              DotsIndicator(
                dotsCount: 5,
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
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [LargeText(text: "Popular recipes"), SmallText(text: "SHOW ALL")],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dimensions.width20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recipeList.length,
                  itemBuilder: (context, index) {
                    final RecipeModel singleRecipe = recipeList[index];
                    return PopularListItem(
                      title: singleRecipe.name!,
                      difficulty: singleRecipe.difficulty!,
                      description: singleRecipe.shortDescription!,
                      timeEstimate: singleRecipe.preparationTime!,
                      imageUrl: singleRecipe.picture,
                      onTap: () {
                        Navigator.push(
                          (context),
                          MaterialPageRoute(
                            builder: (context) => RecipePage(recipeModel: singleRecipe),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          );
        } else {
          return const Text("error");
        }
      },
    );
  }

  Widget _buildPageItem(int index) {
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

    // Slide item
    return Transform(
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
                  blurRadius: 26,
                )
              ],
              image: const DecorationImage(
                image: AssetImage("assets/images/rice.jpg"),
                fit: BoxFit.cover,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LargeText(text: "Food dish name"),
                          SizedBox(height: Dimensions.height10),
                          const RatingsRow(ratingScore: 4.5, commentCount: 1245),
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
    );
  }
}
