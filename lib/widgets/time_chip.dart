import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/recipe_app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeChip extends StatelessWidget {
  final String text;
  double size;
  double height;

  TimeChip({
    Key? key,
    required this.text,
    this.size = 13,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        right: 7,
        left: 8,
      ),
      decoration: BoxDecoration(
        color: RecipeAppTheme.colors.blueLight,
        boxShadow: const [
          BoxShadow(blurRadius: 3, spreadRadius: 1, color: Colors.black12, offset: Offset(2, 2)),
        ],
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(15),
          topLeft: Radius.circular(15),
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
          Text(
            text,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: RecipeAppTheme.colors.blueAccent,
                fontSize: size,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
