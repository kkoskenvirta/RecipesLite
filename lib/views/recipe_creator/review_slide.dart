import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/category/category_model.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';
import 'package:flutter_e_commerce/widgets/categorization_bar.dart';
import 'package:flutter_e_commerce/widgets/incredients_table.dart';
import 'package:flutter_e_commerce/widgets/information_bar.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/ratings_bar.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart' as img;

class ReviewSlide extends StatelessWidget {
  const ReviewSlide({
    Key? key,
  }) : super(key: key);

  Future generateBlurHash(File tempImage) async {
    var data = await tempImage.readAsBytes();
    final blurImage = img.decodeImage(data.toList());
    final blurHash = BlurHash.encode(blurImage!, numCompX: 4, numCompY: 3);
    return blurHash;
  }

  Future pickImage(context) async {
    final ImagePicker imagePicker = ImagePicker();

    try {
      final formDataCubit = BlocProvider.of<FormDataCubit>(context);

      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 60,
        maxWidth: 1000,
        maxHeight: 1500,
      );
      if (image == null) return;
      final tempImage = File(image.path);

      formDataCubit.updateRecipeImage(tempImage);

      formDataCubit.updateBlurHashStatus(BlurHashStatus.loading);
      // final blurHash = await generateBlurHash(tempImage);
      final blurHash = await compute(generateBlurHash, tempImage);
      formDataCubit.updateBlurHash(blurHash.hash);
      formDataCubit.updateBlurHashStatus(BlurHashStatus.loaded);

      return;
    } on PlatformException catch (e) {
      print("failed to pick an image" + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        final recipe = state;
        final incredients = state.incredients;
        final categories = state.categories;
        final tags = state.tags;
        final image = state.image;

        return Column(children: [
          ClipRect(
            child: BlocBuilder<FormDataCubit, FormDataState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.maxFinite,
                  height: Dimensions.recipeImgSize + 0,
                  child: GestureDetector(
                    onTap: () async => pickImage(context),
                    child: image != null
                        ? Container(
                            height: 250,
                            width: 280,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.pink.shade100, width: 0),
                              image: DecorationImage(
                                image: AssetImage(image.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 48,
                              ),
                            ),
                          )
                        : Container(
                            height: 200,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.pink.shade50,
                              border: Border.all(color: Colors.pink.shade100, width: 1),
                            ),
                            child: Center(
                              child: Container(
                                height: 120,
                                width: 180,
                                color: Colors.pink.shade50,
                                child: Icon(
                                  Icons.add_a_photo_rounded,
                                  size: 48,
                                ),
                              ),
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          SingleChildScrollView(
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: Dimensions.width15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: const Color.fromARGB(255, 252, 242, 246),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [if (recipe.name != null) LargeText(text: recipe.name!)],
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  if (recipe.difficulty != null && recipe.preparationTime != null)
                    InformationBar(
                      status: recipe.difficulty!,
                      timeEstimate: recipe.preparationTime!,
                    ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  CategorizationBar(categories: state.categories, tags: state.tags),
                  const SizedBox(
                    height: 12,
                  ),
                  Divider(
                    height: 1,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(alignment: Alignment.centerLeft, child: LargeText(size: 16, text: "Incredients")),
                  const SizedBox(
                    height: 12,
                  ),
                  IncredientsTable(incredients: state.incredients),
                  const SizedBox(
                    height: 12,
                  ),
                  Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Align(alignment: Alignment.centerLeft, child: LargeText(size: 16, text: "Instructions")),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    recipe.instructions,
                  ),
                  SizedBox(
                    height: Dimensions.height45,
                  ),
                ]),
              )
            ]),
          ),
        ]);
      },
    );
  }
}
