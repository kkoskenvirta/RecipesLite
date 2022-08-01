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
          const CategoriesHeader(),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
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

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      title: "Categories",
      leadingButtonIcon: Icon(Icons.search),
      onLeadingButtonPressed: () => showBarModalBottomSheet(
        expand: true,
        context: context,
        backgroundColor: Colors.white,
        builder: (context) => const SearchModal(),
      ),
      trailingButtonIcon: Icon(
        Icons.add_box,
      ),
      onTrailingButtonPressed: () {
        Navigator.pushNamed(context, Routes.recipeCreator.name);
      },
    );
    ;
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
                          Navigator.push(
                            (context),
                            MaterialPageRoute(
                              builder: (context) => SingleCategoryScreen(category: category),
                            ),
                          );
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