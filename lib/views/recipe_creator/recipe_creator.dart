import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/repositorys/category_repository.dart';
import 'package:flutter_e_commerce/repositorys/recipes_repository.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_fetch/form_fetch_cubit.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_stepper/stepper_cubit.dart';
import 'package:flutter_e_commerce/widgets/header/header.dart';
import 'package:flutter_e_commerce/widgets/incredients_builder/incredients_builder.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';
import 'package:image_picker/image_picker.dart';

class RecipeCreatorScreen extends StatelessWidget {
  const RecipeCreatorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const FormFetchHeader(),
              Flexible(
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => FormFetchCubit(categoryRepository: context.read<CategoryRepository>()),
                    ),
                    BlocProvider(
                      create: (context) => FormDataCubit(recipesRepository: context.read<RecipesRepository>()),
                    ),
                  ],
                  child: const FormFetchScreenBody(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FormFetchHeader extends StatelessWidget {
  const FormFetchHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 0, bottom: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Header(
          title: "New recipe",
          showLeftButton: false,
          showRightButton: false,
        ));
  }
}

class FormFetchScreenBody extends StatelessWidget {
  const FormFetchScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final QuillController _controller = QuillController.basic();
    final ImagePicker imagePicker = ImagePicker();
    final formDataCubit = BlocProvider.of<FormDataCubit>(context);

    Future pickImage() async {
      try {
        final XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final tempImage = File(image.path);
        formDataCubit.updateRecipeImage(tempImage);
      } on PlatformException catch (e) {
        print("failed to pick an image" + e.toString());
      }
    }

    return BlocBuilder<FormFetchCubit, FormFetchState>(
      bloc: BlocProvider.of<FormFetchCubit>(context)..getFieldOptions(),
      builder: (context, state) {
        switch (state.status) {
          case FormFetchStateStatus.loading:
            return const CircularProgressIndicator();
          case FormFetchStateStatus.loaded:
            // items for dropdowns
            final categories = state.categories;
            final tags = state.tags;
            return BlocBuilder<FormDataCubit, FormDataState>(
              builder: (context, state) {
                final image = state.image;
                return BlocProvider(
                  create: (context) => StepperCubit(),
                  child: BlocBuilder<StepperCubit, StepperState>(
                    builder: (context, state) {
                      final stepperCubit = BlocProvider.of<StepperCubit>(context);

                      return Center(
                        child: Stepper(
                          elevation: 1,
                          type: StepperType.horizontal,
                          currentStep: state.index,
                          onStepContinue: () {
                            stepperCubit.nextStep();
                          },
                          onStepCancel: () {
                            if (state.index == 0) {
                              Navigator.pop(context);
                            }
                            stepperCubit.previousStep();
                          },
                          steps: <Step>[
                            Step(
                              title: SmallText(text: 'Details'),
                              content: Column(
                                children: <Widget>[
                                  Align(alignment: Alignment.centerLeft, child: SmallText(text: "Recipe name")),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Recipe name",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(alignment: Alignment.centerLeft, child: SmallText(text: "Recipe description")),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Short description of the recipe",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(alignment: Alignment.centerLeft, child: SmallText(text: "Instructions")),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  TextFormField(
                                    maxLines: 8,
                                    keyboardType: TextInputType.multiline,
                                    decoration: const InputDecoration(
                                      hintText: "Instructions on how to prepare the recipe",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(alignment: Alignment.centerLeft, child: SmallText(text: "Recipe incredients")),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  IncredientsBuilder(incredients: [...formDataCubit.state.incredients]),
                                ],
                              ),
                              isActive: state.index >= 0,
                              state: state.index >= 0 ? StepState.complete : StepState.disabled,
                            ),
                            Step(
                              title: SmallText(text: 'Photo'),
                              content: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => pickImage(),
                                    child: image != null
                                        ? Container(
                                            height: 280,
                                            width: 280,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: AssetImage(image.path),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 250,
                                            width: 250,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.black12,
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                              isActive: state.index >= 1,
                              state: state.index >= 1 ? StepState.complete : StepState.disabled,
                            ),
                            Step(
                              title: SmallText(text: 'Categories'),
                              content: Column(
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(labelText: 'Photo'),
                                  ),
                                  // TextFormField(
                                  //   decoration: InputDecoration(labelText: 'Password'),
                                  // ),
                                ],
                              ),
                              isActive: state.index >= 2,
                              state: state.index >= 2 ? StepState.complete : StepState.disabled,
                            ),
                            Step(
                              title: SmallText(text: 'Review'),
                              content: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: const InputDecoration(labelText: 'Photo'),
                                  ),
                                  // TextFormField(
                                  //   decoration: InputDecoration(labelText: 'Password'),
                                  // ),
                                ],
                              ),
                              isActive: state.index >= 3,
                              state: state.index >= 3 ? StepState.complete : StepState.disabled,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
