import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/utils/typography.dart';
import 'package:flutter_e_commerce/widgets/typography/small_text.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog(
      {Key? key, required this.title, required this.text, required this.confirmText, required this.declineText})
      : super(key: key);
  final String title;
  final String text;
  final String confirmText;
  final String declineText;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(text),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: SmallText(
            text: confirmText,
            fontSize: FontSize.smallPlus,
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        ElevatedButton(
          child: SmallText(
            text: declineText,
            fontSize: FontSize.smallPlus,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ],
    );
  }
}
