import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/utils/int_extension.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';

class DifficultySelector extends StatelessWidget {
  DifficultySelector({Key? key}) : super(key: key);

  final List<String> difficulty = [
    'easy',
    'medium',
    'hard',
  ];

  final preparationTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        preparationTimeController.text =
            state.preparationTime != null ? state.preparationTime!.parseToTimeString() : "";

        void updateDifficulty(String text) {
          BlocProvider.of<FormDataCubit>(context).updateRecipeDifficulty(text);
        }

        void updatePreparationTime(Duration date) {
          BlocProvider.of<FormDataCubit>(context).updateRecipePreparationTime(date);
        }

        void showDatePicker(currentTime) {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext builder) {
              Duration timer = const Duration(minutes: 0);
              return Container(
                height: 290,
                color: Colors.white,
                child: Column(
                  children: [
                    CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.hm,
                      minuteInterval: 5,
                      initialTimerDuration:
                          currentTime != null ? Duration(minutes: currentTime) : const Duration(minutes: 0),
                      onTimerDurationChanged: (value) {
                        if (value != currentTime) {
                          timer = value;
                        }
                      },
                    ),
                    CupertinoButton(
                        child: const Text('OK'),
                        onPressed: () {
                          updatePreparationTime(timer);
                          Navigator.of(context).pop();
                        })
                  ],
                ),
              );
            },
          );
        }

        return Column(children: [
          Row(
            children: [
              Container(
                width: 120,
                child: DropdownButtonFormField<String>(
                  icon: null,
                  decoration: const InputDecoration(
                    filled: true,
                  ),
                  value: state.difficulty,
                  items: difficulty
                      .map((unit) => DropdownMenuItem(
                            value: unit,
                            child: Text(unit),
                          ))
                      .toList(),
                  onChanged: (text) => updateDifficulty(text.toString()),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: preparationTimeController,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Preparation time",
                    filled: true,
                  ),
                  validator: ((value) => null),
                  readOnly: true,
                  onTap: () => showDatePicker(state.preparationTime),
                ),
              ),
            ],
          ),
        ]);
      },
    );
  }
}
