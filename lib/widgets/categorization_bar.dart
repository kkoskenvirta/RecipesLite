import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/routes/app_router.gr.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

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
        const Align(
          alignment: Alignment.centerLeft,
          child: LargeText(fontSize: FontSize.mediumPlus, text: "Categories"),
        ),
        const SizedBox(
          height: 4,
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
                fontSize: FontSize.small,
              ),
            );
          }).toList(),
        ),
        const SizedBox(
          height: 8,
        ),
        if (tagList.isNotEmpty)
          const Align(
            alignment: Alignment.centerLeft,
            child: LargeText(fontSize: FontSize.mediumPlus, text: "Dietary tags"),
          ),
        const SizedBox(
          height: 4,
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
                fontSize: FontSize.small,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
