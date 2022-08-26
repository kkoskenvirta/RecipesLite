import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

class TagList extends StatelessWidget {
  const TagList({Key? key, required this.categories, required this.tags, required this.tagFilters}) : super(key: key);

  final List<TagModel> tagFilters;
  final List<CategoryModel> categories;
  final List<TagModel> tags;

  Widget getTagWidgets(List<CategoryModel> categories, List<TagModel> tags) {
    List<Widget> list = [];
    List<TagModel> tagList = [...tags];

// Move filtered tags to first in list
    if (tagFilters.isNotEmpty) {
      for (var i = 0; i < tagFilters.length; i++) {
        int index = tagList.indexWhere((tag) => tag.id == tagFilters[i].id);

        if (index >= 0) {
          tagList.removeAt(index);
          tagList.insert(0, tagFilters[i]);
        }
      }
    }

    for (var i = 0; i < tagList.length; i++) {
      if (i < 2) {
        list.add(TagChip(
          backgroundColor: RecipeAppTheme.colors.pinkAccent,
          textColor: Colors.white,
          text: tagList[i].name,
          fontSize: FontSize.verySmall,
        ));
        list.add(const SizedBox(
          width: 5,
        ));
      }
      if (i > 2) {
        list.add(TagChip(
          backgroundColor: RecipeAppTheme.colors.pinkAccent,
          textColor: Colors.white,
          text: '+${tagList.length - 2} more',
          fontSize: FontSize.verySmall,
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

class TagChip extends StatelessWidget {
  final String text;
  final FontSize fontSize;
  final double height;
  final Color backgroundColor;
  final Color textColor;

  const TagChip({
    Key? key,
    required this.text,
    this.fontSize = FontSize.small,
    this.height = 1.2,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SmallText(
        text: text,
        fontSize: fontSize,
        color: textColor,
      ),
    );
  }
}
