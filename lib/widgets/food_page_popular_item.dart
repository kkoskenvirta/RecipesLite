import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/widgets/blurhash_image.dart';
import 'package:flutter_e_commerce/widgets/information_bar.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';
import 'package:get/route_manager.dart';

import '../config/api_config.dart';

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
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
            ),
          ],
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        child: Row(
          children: [
            // CachedNetworkImage(
            //   height: Dimensions.listViewImgSize,
            //   width: Dimensions.listViewImgSize,
            //   imageUrl: '$baseUrl$assetsPath$imageUrl',
            //   imageBuilder: (context, imageProvider) => Container(
            //     height: Dimensions.listViewImgSize,
            //     width: Dimensions.listViewImgSize,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(Dimensions.radius20),
            //       image: DecorationImage(
            //         image: imageProvider,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            //   progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
            //     padding: const EdgeInsets.all(24.0),
            //     child: CircularProgressIndicator(value: downloadProgress.progress),
            //   ),
            // ),
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
                      timeEstimate: timeEstimate,
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
