import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeText extends StatelessWidget {
  const LargeText(
      {Key? key,
      this.color = Colors.black87,
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.fontSize = FontSize.mediumPlus,
      this.fontWeight = FontWeight.w500})
      : super(key: key);

  final Color? color;
  final String text;
  final FontWeight? fontWeight;
  final FontSize fontSize;
  final TextOverflow overFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: overFlow,
      // style: GoogleFonts.barlowCondensed(
      style: GoogleFonts.barlowCondensed(
        textStyle: TextStyle(
          height: 1.1,
          color: color,
          fontSize: largeTextFontSize(fontSize).toDouble(),
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
