import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

class DifficultyChip extends StatelessWidget {
  const DifficultyChip({
    Key? key,
    required this.text,
    this.fontSize = FontSize.small,
    this.height = 1.2,
    this.horizontal = 10.0,
    this.vertical = 8.0,
  }) : super(key: key);

  final String text;
  final FontSize fontSize;
  final double height;
  final double horizontal;
  final double vertical;

  difficultyColor(String status) {
    if (status.toLowerCase() == "easy") {
      return Colors.green.shade50;
    } else if (status.toLowerCase() == "medium") {
      return Colors.yellow.shade100;
    } else if (status.toLowerCase() == "hard") {
      return Colors.red.shade50;
    }
  }

  difficultyIconColor(String status) {
    if (status.toLowerCase() == "easy") {
      return Colors.green.shade400;
    } else if (status.toLowerCase() == "medium") {
      return const Color.fromARGB(255, 251, 187, 24);
    } else if (status.toLowerCase() == "hard") {
      return Colors.red.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      decoration: BoxDecoration(
          color: difficultyColor(text),
          borderRadius: BorderRadius.all(
            Radius.circular(Dimensions.radius15),
          )),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: difficultyIconColor(text),
            size: 14,
          ),
          const SizedBox(
            width: 3,
          ),
          SmallText(
            text: text,
            fontSize: fontSize,
            color: difficultyIconColor(text),
          ),
        ],
      ),
    );
  }
}
