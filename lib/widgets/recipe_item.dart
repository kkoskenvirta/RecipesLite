import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/int_extension.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/widgets/blurhash_image.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';
import 'package:flutter_e_commerce/widgets/tag_chip.dart';
import 'package:flutter_e_commerce/widgets/tag_list.dart';
import 'package:flutter_e_commerce/widgets/time_chip.dart';

class RecipeItem extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String description;

  final String difficulty;
  final String distance;
  final int timeEstimate;
  final VoidCallback? onTap;
  final List<CategoryModel> categories;
  final List<TagModel> tags;

  final String? blurhash;
  const RecipeItem({
    Key? key,
    this.imageUrl,
    this.title = "",
    this.difficulty = "",
    this.description = "",
    this.distance = "",
    this.blurhash = "",
    this.categories = const [],
    this.tags = const [],
    this.timeEstimate = 0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List categoryList = categories.isNotEmpty ? Set.from(categories).toList() : [];
    final List tagList = tags.isNotEmpty ? Set.from(tags).toList() : [];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black12,
            ),
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius15),
        ),
        height: Dimensions.listViewImgSize,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: imageUrl ?? "hero",
              child: Material(
                child: Stack(
                  children: [
                    BlurhashImage(
                      aspectRatio: 1,
                      image: imageUrl,
                      blurhash: blurhash!,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: TimeChip(
                        size: 12,
                        text: timeEstimate.parseToTimeString(),
                        horizontal: 8,
                        vertical: 7,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TagList(categories: categories, tags: tags),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: LargeText(
                        text: title,
                        overFlow: TextOverflow.ellipsis,
                        size: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // const Spacer(),
                    SmallText(text: description),
                    // const SizedBox(height: 4),

                    // InformationBar(
                    //   status: difficulty,
                    //   timeEstimate: timeEstimate,
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
