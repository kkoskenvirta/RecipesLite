import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/widgets/blurhash_image.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

class CategoryItem extends StatelessWidget {
  final String? imageUrl;
  final String? blurhash;
  final String title;
  final String recipesCount;

  final VoidCallback? onTap;

  const CategoryItem({
    Key? key,
    this.imageUrl,
    this.title = "",
    this.recipesCount = "",
    this.onTap,
    this.blurhash,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [RecipeAppTheme.shadows.normal],
          borderRadius: BorderRadius.circular(Dimensions.radius15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlurhashImage(
                aspectRatio: 1.5,
                image: imageUrl,
                blurhash: blurhash,
                height: 140,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LargeText(
                    text: title,
                    size: 18,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SmallText(text: '$recipesCount recipes')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
