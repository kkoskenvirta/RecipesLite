import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/views/recipe_creator/cubit/form_data/form_data_cubit.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

class TagSelector extends StatelessWidget {
  const TagSelector({
    Key? key,
    required this.tags,
  }) : super(key: key);

  final List<TagModel> tags;

  @override
  Widget build(BuildContext context) {
    void updateTag(TagModel tag, bool status) {
      BlocProvider.of<FormDataCubit>(context).updateTagList(tag, status);
    }

    final List tagList = Set.from(tags).toList();

    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        return Wrap(
          spacing: 10,
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          children: tagList.map((tag) {
            final match = state.tags.indexWhere((stateTag) => stateTag.id == tag.id);
            final status = match == -1 ? false : true;
            return FilterChip(
                showCheckmark: false,
                label: SmallText(
                  text: tag.name,
                  color: status ? Colors.white : Colors.black87,
                  fontSize: FontSize.smallPlus,
                ),
                selected: status,
                onSelected: (status) => updateTag(tag, status));
          }).toList(),
        );
      },
    );
  }
}
