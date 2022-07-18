import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/user_data/cubit/user_data_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/models/user/user_model.dart';

import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/recipe/recipe_page.dart';
import 'package:flutter_e_commerce/widgets/food_page_popular_item.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  // final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 242, 246),
      body: SafeArea(
        child: Column(children: [
          ProfileHeader(),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<UserDataCubit, UserDataState>(builder: (context, state) {
            switch (state.status) {
              case UserDataStateStatus.loading:
                return CircularProgressIndicator();

              case UserDataStateStatus.loaded:
                return ProfileBody(
                  profile: state.currUser!,
                );

              default:
                return SizedBox();
            }
          })
        ]),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            tooltip: "Return",
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left_rounded),
          ),
          LargeText(text: "Profile"),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            tooltip: "Logout",
            onPressed: () {
              authCubit.logout();
            },
            icon: Icon(Icons.logout_rounded),
          )
        ],
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key, required this.profile}) : super(key: key);
  final UserModel profile;

  @override
  Widget build(BuildContext context) {
    final userDataCubit = BlocProvider.of<UserDataCubit>(context);

    return SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.maxFinite,
          child: Column(
            children: [
              CachedNetworkImage(
                height: Dimensions.listViewImgSize,
                width: Dimensions.listViewImgSize,
                imageUrl: '$baseUrl$assetsPath${profile.avatar}',
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
              SizedBox(
                height: 10,
              ),
              LargeText(
                text: profile.firstName,
                size: 32,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeText(text: "Favorite recipes"),
                    SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<UserDataCubit, UserDataState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case UserDataStateStatus.loading:
                            return CircularProgressIndicator();

                          case UserDataStateStatus.loaded:
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.favorites.length,
                              itemBuilder: (context, index) {
                                final recipeFetchCubit = BlocProvider.of<RecipeFetchCubit>(context);

                                // final favoriteRecipesList = recipeFetchCubit.fetchMultiple(favorites);
                                final RecipeModel singleRecipe = state.favorites[index];
                                return PopularListItem(
                                  title: singleRecipe.name,
                                  difficulty: singleRecipe.difficulty,
                                  description: singleRecipe.shortDescription,
                                  timeEstimate: singleRecipe.preparationTime,
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
                            );

                          default:
                            return SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
