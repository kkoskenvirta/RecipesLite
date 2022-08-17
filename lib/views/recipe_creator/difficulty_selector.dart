import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/utils/int_extension.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';

class DifficultySelector extends StatelessWidget {
  DifficultySelector({Key? key}) : super(key: key);

  final List<String> difficulty = [
    'Easy',
    'Medium',
    'Hard',
  ];

  final difficultyController = TextEditingController();
  final preparationTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        difficultyController.text = state.difficulty != null ? state.difficulty! : "";
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
                    const Divider(
                      height: 8,
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

        void showDifficultyPicker(currentTime) {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext builder) {
              String text = "";
              return Container(
                height: 290,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      child: CupertinoPicker(
                          itemExtent: 36,
                          children: difficulty.map((unit) => Center(child: Text(unit))).toList(),
                          onSelectedItemChanged: (index) {
                            if (difficulty[index] != text) {
                              text = difficulty[index];
                            }
                          }),
                    ),
                    const Divider(
                      height: 8,
                    ),
                    CupertinoButton(
                      child: const Text('OK'),
                      onPressed: () {
                        updateDifficulty(text.toString());
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              );
            },
          );
        }

        return Column(children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: difficultyController,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Difficulty",
                    filled: true,
                  ),
                  validator: ((value) => null),
                  readOnly: true,
                  onTap: () => showDifficultyPicker(state.preparationTime),
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
