import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/utils/dimensions.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class LabelAndIcon extends StatelessWidget {
  final String text;
  final Icon icon;

  const LabelAndIcon({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 4,
          ),
          SmallText(text: text),
          SizedBox(
            width: 4,
          )
        ],
      ),
    );
  }
}
