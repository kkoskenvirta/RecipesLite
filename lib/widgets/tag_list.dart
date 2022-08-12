import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/widgets/tag_chip.dart';

class TagList extends StatelessWidget {
  const TagList({
    Key? key,
    required this.categories,
    required this.tags,
  }) : super(key: key);

  final List<CategoryModel> categories;
  final List<TagModel> tags;
  Widget getTagWidgets(List<CategoryModel> categories, List<TagModel> tags) {
    List<Widget> list = [];

    // if (categories.length > 0) {
    for (var i = 0; i < tags.length; i++) {
      if (i < 2) {
        list.add(TagChip(
          backgroundColor: RecipeAppTheme.colors.pinkLight,
          textColor: RecipeAppTheme.colors.pinkAccent,
          text: tags[i].name,
          size: 11,
        ));
        list.add(const SizedBox(
          width: 4,
        ));
      }
    }

    return Row(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return getTagWidgets(categories, tags);
  }
}
