import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/config/api_config.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:octo_image/octo_image.dart';

class BlurhashImage extends StatelessWidget {
  const BlurhashImage(
      {Key? key,
      required this.aspectRatio,
      this.image,
      required this.blurhash,
      this.height,
      this.width,
      this.borderRadius,
      this.boxShadow})
      : super(key: key);
  final double aspectRatio;
  final String? image;
  final String? blurhash;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          boxShadow: boxShadow ?? [const BoxShadow(color: Colors.transparent)],
        ),
        height: height ?? Dimensions.listViewImgSize,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(Dimensions.radius20),
            child: OctoImage(
              image: CachedNetworkImageProvider(
                '$baseUrl$assetsPath$image$qualityPath',
              ),
              placeholderBuilder: OctoPlaceholder.blurHash(blurhash!),
              fit: BoxFit.cover,
              fadeOutDuration: const Duration(milliseconds: 350),
            ),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
        ),
        height: Dimensions.listViewImgSize,
        width: Dimensions.listViewImgSize,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            child: ColoredBox(
              color: Colors.pink.shade100,
            ),
          ),
        ),
      );
    }
  }
}
