import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/category/categories_cubit.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/category_item.dart';

import '../../routes/app_router.gr.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Categories",
        showSearchButton: true,
        showCreateButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CategoriesPageBody(),
          ],
        ),
      ),
    );
  }
}

class CategoriesPageBody extends StatelessWidget {
  const CategoriesPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return Column(
      children: [
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            switch (state.status) {
              case CategoriesStateStatus.loading:
                return const CircularProgressIndicator();
              case CategoriesStateStatus.loaded:
                final categoryList = state.categories;
                return Padding(
                  padding: EdgeInsets.all(Dimensions.width20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 220, crossAxisSpacing: 18, mainAxisSpacing: 0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      final CategoryModel category = categoryList[index];
                      return CategoryItem(
                        title: category.name,
                        imageUrl: category.picture,
                        blurhash: category.blurhash,
                        recipesCount: category.recipesCount!,
                        onTap: () {
                          router.push(CategoryRoute(categoryFilters: [category], categoryId: category.id));
                        },
                      );
                    },
                  ),
                );
              default:
                return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
