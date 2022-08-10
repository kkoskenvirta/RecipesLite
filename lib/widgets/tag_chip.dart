import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagChip extends StatelessWidget {
  final String text;
  double size;
  double height;
  final Color backgroundColor;
  final Color textColor;

  TagChip({
    Key? key,
    required this.text,
    this.size = 13,
    this.height = 1.2,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            color: textColor,
            fontSize: size,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
