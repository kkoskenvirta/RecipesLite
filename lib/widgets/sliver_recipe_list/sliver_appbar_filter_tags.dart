import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/models/tag/tag_model.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

class AppBarFilterTags extends StatelessWidget {
  const AppBarFilterTags({
    super.key,
    required this.tagList,
    required AnimationController animationController,
    required this.onSelect,
    required this.tagFilters,
  }) : _animationController = animationController;

  final List tagList;
  final AnimationController _animationController;
  final Function onSelect;
  final List<TagModel> tagFilters;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 400,
        child: Wrap(
          spacing: 8,
          alignment: WrapAlignment.start,
          runSpacing: 0.0,
          children: tagList.map((tag) {
            final match = tagFilters.indexWhere((filter) => filter.id == tag.id);
            final status = match == -1 ? false : true;
            return FadeTransition(
              opacity: _animationController,
              child: FilterChip(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                selected: status,
                showCheckmark: false,
                visualDensity: VisualDensity(vertical: -1),
                label: SmallText(
                  text: tag.name,
                  color: status ? Colors.white : Colors.black87,
                  fontSize: FontSize.small,
                ),
                onSelected: ((status) => onSelect(tag, status)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
