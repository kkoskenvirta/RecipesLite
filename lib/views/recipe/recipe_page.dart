import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/profile/cubit/profile_cubit.dart';
import 'package:flutter_e_commerce/modules/dio_module.dart';
import 'package:flutter_e_commerce/modules/directus_module.dart';
import 'package:flutter_e_commerce/repositorys/user_repository.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/scale_func.dart';
import 'package:flutter_e_commerce/widgets/information_bar.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/ratings_bar.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/api_config.dart';
import '../../models/recipe/recipe_model.dart';

class RecipePage extends StatefulWidget {
  final RecipeModel recipeModel;

  const RecipePage({
    Key? key,
    required this.recipeModel,
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

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 242, 246),
      body: Stack(children: [
        ClipRect(
          child: Transform.scale(
            scale: _scaleFactor,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.recipeImgSize + 100,
              child: CachedNetworkImage(
                height: Dimensions.listViewImgSize,
                width: Dimensions.listViewImgSize,
                imageUrl: '$baseUrl$assetsPath${widget.recipeModel.picture}',
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
                padding: EdgeInsets.all(Dimensions.width15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Color.fromARGB(255, 252, 242, 246),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LargeText(text: widget.recipeModel.name),
                      BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
                        final profileCubit = BlocProvider.of<ProfileCubit>(context);

                        if (state.status == ProfileStateStatus.loaded) {
                          final result = state.favorites.where((recipe) => recipe.recipeId == widget.recipeModel.id);
                          final bool favorited = result.isEmpty ? false : true;

                          return IconButton(
                              onPressed: () {
                                profileCubit.toggleFavorites(widget.recipeModel.id);
                              },
                              icon: favorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border_rounded));
                        }
                        return SizedBox();
                      }),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  const RatingsRow(ratingScore: 4.5, commentCount: 173),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  InformationBar(
                    status: widget.recipeModel.difficulty,
                    timeEstimate: widget.recipeModel.preparationTime,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  MarkdownBody(
                    data: widget.recipeModel.instructions,
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
                color: Color.fromARGB(255, 252, 242, 246),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 10,
                    blurRadius: 10,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Center(
                child: Icon(Icons.chevron_left_rounded),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
