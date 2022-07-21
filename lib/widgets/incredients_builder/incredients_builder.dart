import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/incredient/incredient_model.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class IncredientsBuilder extends StatelessWidget {
  IncredientsBuilder({Key? key, required this.incredients}) : super(key: key);
  List<IncredientModel> incredients = [];

  addIncredient(context) {
    final formDataCubit = BlocProvider.of<FormDataCubit>(context);
    formDataCubit.addIncredient();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                IncredientRow(index: index),
              ],
            );
          },
          separatorBuilder: ((context, index) {
            return const SizedBox(
              height: 8,
            );
          }),
          itemCount: incredients.length,
        ),
        SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            addIncredient(context);
          },
          child: Column(children: [AddIncredientRow()]),
        )
      ],
    );
  }
}

class IncredientRow extends StatelessWidget {
  IncredientRow({Key? key, required this.index}) : super(key: key);
  final int index;

  final List<String> unitOptions = [
    'gram',
    'kg',
    'ml',
    'dl',
    'l',
    'tbsp',
    'tsp',
  ];

  removeIncredient(context) {
    final formDataCubit = BlocProvider.of<FormDataCubit>(context);
    formDataCubit.removeIncredient(index);
  }

  void updateName(context, String name) {
    BlocProvider.of<FormDataCubit>(context).updateIncredientName(index, name);
  }

  void updateAmount(context, String amount) {
    BlocProvider.of<FormDataCubit>(context).updateIncredientAmount(index, amount);
  }

  void updateUnit(context, String unit) {
    BlocProvider.of<FormDataCubit>(context).updateIncredientUnit(index, unit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        final incredient = state.incredients[index];

        return Dismissible(
          key: Key("Item ${index}"),
          direction: index > 0 ? DismissDirection.endToStart : DismissDirection.none,
          onDismissed: (_) => removeIncredient(context),
          dismissThresholds: const {DismissDirection.endToStart: 0.6},
          background: Container(
            color: Colors.pink.shade400,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: Row(
            children: [
              SmallText(text: "${index + 1}."),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Incredient",
                    filled: false,
                  ),
                  initialValue: incredient.name,
                  onChanged: (name) => updateName(context, name),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "amount",
                    filled: false,
                  ),
                  initialValue: incredient.amount == null ? "" : incredient.amount.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (amount) => updateAmount(context, amount),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                  width: 70,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: false,
                    ),
                    value: incredient.unit,
                    items: unitOptions
                        .map((unit) => DropdownMenuItem(
                              value: unit,
                              child: Text(unit),
                            ))
                        .toList(),
                    onChanged: (unit) => updateUnit(context, unit.toString()),
                  ))
            ],
          ),
        );
      },
    );
  }
}

class AddIncredientRow extends StatelessWidget {
  AddIncredientRow({
    Key? key,
  }) : super(key: key);

  final List<String> unitOptions = [
    'gram',
    'kg',
    'ml',
    'dl',
    'l',
    'tbsp',
    'tsp',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        final incredientCount = state.incredients.length;

        return Row(
          children: [
            SmallText(text: "${incredientCount + 1}."),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 3,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Incredient",
                  filled: false,
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              flex: 1,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "amount",
                  filled: false,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Container(
                width: 70,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    filled: false,
                  ),
                  value: "gram",
                  items: unitOptions
                      .map((unit) => DropdownMenuItem(
                            value: unit,
                            child: Text(unit),
                          ))
                      .toList(),
                  onChanged: (unit) => {},
                ))
          ],
        );
      },
    );
  }
}
