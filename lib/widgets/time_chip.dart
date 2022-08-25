import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

class TimeChip extends StatelessWidget {
  final String text;
  final FontSize fontSize;
  final double height;
  final double horizontal;
  final double vertical;
  final bool rounded;

  const TimeChip({
    Key? key,
    required this.text,
    this.fontSize = FontSize.small,
    this.height = 1.2,
    this.horizontal = 10.0,
    this.vertical = 8.0,
    this.rounded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      decoration: BoxDecoration(
        color: RecipeAppTheme.colors.blueLight,
        boxShadow: rounded
            ? null
            : const [
                BoxShadow(blurRadius: 3, spreadRadius: 1, color: Colors.black12, offset: Offset(2, 2)),
              ],
        borderRadius: rounded
            ? BorderRadius.all(
                Radius.circular(Dimensions.radius15),
              )
            : BorderRadius.only(
                bottomRight: Radius.circular(Dimensions.radius15),
                topLeft: Radius.circular(Dimensions.radius15),
              ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.timer_outlined,
            color: RecipeAppTheme.colors.blueAccent,
            size: 14,
          ),
          const SizedBox(
            width: 2,
          ),
          SmallText(
            text: text,
            fontSize: fontSize,
            color: RecipeAppTheme.colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
