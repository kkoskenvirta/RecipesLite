import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/auth/cubit/auth_cubit.dart';
import 'package:flutter_e_commerce/global/blocks/recipes/cubit/recipe_fetch_cubit.dart';
import 'package:flutter_e_commerce/models/recipe/recipe_model.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/views/home/cubit/recipe_search_cubit.dart';
import 'package:flutter_e_commerce/views/home/home_body.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/home/search_modal.dart';
import 'package:flutter_e_commerce/views/home/search_modal_results.dart';
import 'package:flutter_e_commerce/views/recipe/recipe_page.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../widgets/food_page_popular_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 242, 246),
      body: BlocBuilder<RecipeFetchCubit, RecipeFetchState>(
        builder: (context, state) {
          if (state is RecipeFetchInitial) {
            return Center(child: const CircularProgressIndicator());
          } else if (state is RecipeFetchLoading) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          } else if (state is RecipeFetchError) {
            return Center(child: Text("Error happened"));
          } else if (state is RecipeFetchLoaded) {
            final recipeList = state.recipeList;
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.profile.name);
                                },
                                tooltip: "User profile",
                                icon: Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.pink.shade400,
                                  size: 36,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => showBarModalBottomSheet(
                                expand: true,
                                context: context,
                                backgroundColor: Colors.white,
                                builder: (context) => SearchModal()),
                            child: Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.pink.shade300),
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FoodPageBody()
                  ],
                ),
              ),
            );
          }
          return Text("Error");
        },
      ),
    );
  }
}
