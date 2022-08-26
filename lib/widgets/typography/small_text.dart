// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final FontSize fontSize;
  final FontWeight? fontWeight;
  final double height;
  final TextOverflow overFlow;
  final TextAlign textAlign;

  const SmallText({
    Key? key,
    this.color = Colors.black45,
    required this.text,
    this.fontSize = FontSize.small,
    this.height = 1.2,
    this.overFlow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      textAlign: textAlign,
      maxLines: 1,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: color,
          fontSize: smallTextFontSize(fontSize).toDouble(),
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
