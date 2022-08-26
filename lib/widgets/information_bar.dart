import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/int_extension.dart';
import 'package:flutter_e_commerce/utils/string_extension.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/chips/difficulty_chip.dart';
import 'package:flutter_e_commerce/widgets/time_chip.dart';

class InformationBar extends StatelessWidget {
  final String status;
  final int preparationTime;

  const InformationBar({Key? key, required this.status, this.preparationTime = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TimeChip(
          text: preparationTime.parseToTimeString(),
          rounded: true,
          fontSize: FontSize.small,
        ),
        DifficultyChip(
          text: status.capitalize(),
          fontSize: FontSize.small,
        )
      ],
    );
  }
}
