import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/category/categories_cubit.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/category_recipes/single_category_page.dart';
import 'package:flutter_e_commerce/widgets/category_list_item.dart';
import 'package:flutter_e_commerce/widgets/header/header.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/search_modal/search_modal.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  CategoriesScreenBody(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          Get.toNamed(Routes.category.name, arguments: category);
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
