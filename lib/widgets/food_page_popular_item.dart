import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/widgets/blurhash_image.dart';
import 'package:flutter_e_commerce/widgets/information_bar.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class PopularListItem extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String description;

  final String difficulty;
  final String distance;
  final int timeEstimate;
  final VoidCallback? onTap;

  final String? blurhash;
  const PopularListItem({
    Key? key,
    this.imageUrl,
    this.title = "",
    this.difficulty = "",
    this.description = "",
    this.distance = "",
    this.blurhash = "",
    this.timeEstimate = 0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
            ),
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        child: Row(
          children: [
            BlurhashImage(aspectRatio: 1, image: imageUrl, blurhash: blurhash!),
            SizedBox(
              width: Dimensions.width15,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: Dimensions.width10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeText(
                      text: title,
                      overFlow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    SmallText(text: description),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    InformationBar(
                      status: difficulty,
                      preparationTime: timeEstimate,
                    )
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
