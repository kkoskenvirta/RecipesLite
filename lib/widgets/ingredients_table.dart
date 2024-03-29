import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/ingredient/ingredient_model.dart';
import 'package:flutter_e_commerce/models/ingredient_group/ingredient_group_model.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/double_extension.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/typography/large_text.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

List<Widget> buildIngredientsTable(List<IngredientGroupModel> ingredientGroups) {
  List<Widget> widgets = [];

  for (var group in ingredientGroups) {
    widgets.add(LargeText(
      text: group.name,
      fontSize: FontSize.mediumPlus,
    ));
    widgets.add(IngredientsTable(ingredients: group.ingredients));
    widgets.add(const SizedBox(
      height: 16,
    ));
  }
  return widgets;
}

class IngredientsTable extends StatelessWidget {
  const IngredientsTable({Key? key, required this.ingredients}) : super(key: key);
  final List<IngredientModel>? ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      IngredientRow(
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
    );
  }
}

class IngredientRow extends StatelessWidget {
  const IngredientRow({Key? key, required this.index, required this.ingredient}) : super(key: key);
  final IngredientModel ingredient;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: SmallText(
              text: '${ingredient.amount!.doubleToPrettyString()} ${ingredient.unit!}',
              fontSize: FontSize.smallPlus,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: SmallText(
              text: ingredient.name,
              fontSize: FontSize.smallPlus,
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
        ],
      ),
    );
  }
}
