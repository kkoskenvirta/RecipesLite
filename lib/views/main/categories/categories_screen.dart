import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/category/categories_cubit.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/widgets/appbars/main_appbar.dart';
import 'package:flutter_e_commerce/widgets/category_list_item.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../routes/app_router.gr.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
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
            CategoriesScreenBody(),
          ],
        ),
      ),
    );
  }
}

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AutoRouter.of(context);

    return Column(
      children: [
        BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            switch (state.status) {
              case CategoriesStateStatus.loading:
                return CircularProgressIndicator();
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
                      return CategoryListItem(
                        title: category.name,
                        imageUrl: category.picture,
                        blurhash: category.blurhash,
                        onTap: () {
                          router.push(CategoryRoute(category: category, categoryId: category.id));
                        },
                      );
                    },
                  ),
                );
              default:
                return SizedBox();
            }
          },
        )
      ],
    );
  }
}
