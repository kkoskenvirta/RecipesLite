import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/global/blocks/category/categories_cubit.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/recipe_list/single_category_page.dart';
import 'package:flutter_e_commerce/widgets/category_list_item.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/search_modal_button.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BrowseHeader(),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [BrowseScreenBody()],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BrowseHeader extends StatelessWidget {
  const BrowseHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
      padding: EdgeInsets.only(bottom: Dimensions.height10),
      child: LargeText(text: "Categories"),
    );
  }
}

class BrowseScreenBody extends StatelessWidget {
  const BrowseScreenBody({Key? key}) : super(key: key);

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
