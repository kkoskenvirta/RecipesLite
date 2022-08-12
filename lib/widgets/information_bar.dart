import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/int_extension.dart';
import 'package:flutter_e_commerce/utils/string_extension.dart';
import 'label_with_icon.dart';

class InformationBar extends StatelessWidget {
  final String status;
  final int timeEstimate;

  const InformationBar({Key? key, required this.status, this.timeEstimate = 0}) : super(key: key);

  difficultyColor(String status) {
    if (status.toLowerCase() == "easy") {
      return Colors.green.shade400;
    } else if (status.toLowerCase() == "medium") {
      return Colors.yellow.shade400;
    } else if (status.toLowerCase() == "hard") {
      return Colors.red.shade300;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LabelAndIcon(
          text: status.capitalize(),
          icon: Icon(
            Icons.circle,
            color: difficultyColor(status),
            size: 28,
          ),
        ),
        LabelAndIcon(
          text: timeEstimate.parseToTimeString(),
          icon: Icon(
            Icons.schedule,
            color: Colors.pink.shade600,
            size: 28,
          ),
        )
      ],
    );
  }
}
