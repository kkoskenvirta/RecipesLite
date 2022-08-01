import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/views/category_recipes/single_category_page.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class CategorizationBar extends StatelessWidget {
  const CategorizationBar({Key? key, required this.tags, required this.categories, this.disableChipButtons = false})
      : super(key: key);
  final List<TagModel> tags;
  final List<CategoryModel> categories;
  final bool disableChipButtons;

  @override
  Widget build(BuildContext context) {
    final List tagList = Set.from(tags).toList();
    final List categoryList = Set.from(categories).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(alignment: Alignment.centerLeft, child: LargeText(size: 16, text: "Categories")),
        SizedBox(
          height: 2,
        ),
        Wrap(
          spacing: 8,
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          children: categoryList.map((category) {
            return ActionChip(
              onPressed: () {
                if (!disableChipButtons)
                  Navigator.push(
                    (context),
                    MaterialPageRoute(
                      builder: (context) => SingleCategoryScreen(category: category),
                    ),
                  );
              },
              label: SmallText(
                text: category.name,
                color: Colors.black87,
                size: 14,
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 8,
        ),
        if (tags.isNotEmpty) Align(alignment: Alignment.centerLeft, child: LargeText(size: 16, text: "Dietary tags")),
        SizedBox(
          height: 2,
        ),
        Wrap(
          spacing: 8,
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          children: tagList.map((tag) {
            return Chip(
              label: SmallText(
                text: tag.name,
                color: Colors.black87,
                size: 14,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
