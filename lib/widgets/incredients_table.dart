import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/incredient/incredient_model.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/string_extension.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class IncredientsTable extends StatelessWidget {
  IncredientsTable({Key? key, required this.incredients}) : super(key: key);
  List<IncredientModel> incredients = [];

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
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  IncredientRow(
                    index: index,
                    incredient: incredients[index],
                  ),
                ],
              );
            },
            separatorBuilder: ((context, index) {
              return const Divider(
                height: 0,
              );
            }),
            itemCount: incredients.length,
          ),
        ],
      ),
    );
  }
}

class IncredientRow extends StatelessWidget {
  IncredientRow({Key? key, required this.index, required this.incredient}) : super(key: key);
  final IncredientModel incredient;
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
              incredient.name!.capitalize(),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Expanded(
            child: Text(
              '${incredient.amount.toString()} ${incredient.unit!}',
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
