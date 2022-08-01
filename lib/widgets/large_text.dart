import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeText extends StatelessWidget {
  final Color? color;
  final String text;
  FontWeight? fontWeight;
  double size;
  TextOverflow overFlow;

  LargeText(
      {Key? key,
      this.color = Colors.black87,
      required this.text,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0,
      this.fontWeight = FontWeight.w600})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: GoogleFonts.raleway(
        textStyle: TextStyle(
          color: color,
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
