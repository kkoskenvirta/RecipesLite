import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class CategorizationBar extends StatelessWidget {
  const CategorizationBar({Key? key, this.tags, this.categories, this.disableChipButtons = false}) : super(key: key);
  final List<TagModel>? tags;
  final List<CategoryModel>? categories;
  final bool disableChipButtons;

  @override
  Widget build(BuildContext context) {
    final List tagList = tags != null ? Set.from(tags!).toList() : [];
    final List categoryList = categories != null ? Set.from(categories!).toList() : [];
    final router = AutoRouter.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(alignment: Alignment.centerLeft, child: LargeText(size: 16, text: "Categories")),
        const SizedBox(
          height: 2,
        ),
        Wrap(
          spacing: 8,
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          children: categoryList.map((category) {
            return ActionChip(
              backgroundColor: RecipeAppTheme.colors.pinkAccent,
              onPressed: () {
                if (!disableChipButtons) {
                  router.navigate(
                    MainRoute(
                      children: [
                        CategoriesRouter(children: [
                          CategoryRoute(
                            categoryFilters: [category],
                            categoryId: category.id,
                          )
                        ])
                      ],
                    ),
                  );
                }
              },
              label: SmallText(
                text: category.name,
                color: Colors.white,
                size: 14,
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        if (tagList.isNotEmpty)
          Align(alignment: Alignment.centerLeft, child: LargeText(size: 16, text: "Dietary tags")),
        const SizedBox(
          height: 2,
        ),
        Wrap(
          spacing: 8,
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          children: tagList.map((tag) {
            return Chip(
              backgroundColor: RecipeAppTheme.colors.pinkAccent,
              label: SmallText(
                text: tag.name,
                color: Colors.white,
                size: 14,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
