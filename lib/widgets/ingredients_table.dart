import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/ingredient/ingredient_model.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/string_extension.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class ingredientsTable extends StatelessWidget {
  ingredientsTable({Key? key, required this.ingredients}) : super(key: key);
  List<IngredientModel>? ingredients = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(Dimensions.radius15),
          // color: Colors.red,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ingredients != null
              ? ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ingredientRow(
                          index: index,
                          ingredient: ingredients![index],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: ((context, index) {
                    return const Divider(
                      height: 0,
                    );
                  }),
                  itemCount: ingredients!.length,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class ingredientRow extends StatelessWidget {
  ingredientRow({Key? key, required this.index, required this.ingredient}) : super(key: key);
  final IngredientModel ingredient;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SmallText(text: "${index + 1}."),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              ingredient.name,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Text(
              '${ingredient.amount.toString()} ${ingredient.unit!}',
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
