import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/search_modal/search_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Header extends StatelessWidget {
  final String title;
  final bool showLeadingButton;
  final bool showTrailingButton;
  final bool showTitle;

  final Icon? leadingButtonIcon;
  final VoidCallback? onLeadingButtonPressed;

  final Icon? trailingButtonIcon;
  final VoidCallback? onTrailingButtonPressed;

  const Header({
    Key? key,
    required this.title,
    this.showLeadingButton = true,
    this.showTrailingButton = true,
    this.showTitle = true,
    this.leadingButtonIcon = const Icon(Icons.question_mark),
    this.onLeadingButtonPressed,
    this.trailingButtonIcon = const Icon(Icons.question_mark),
    this.onTrailingButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 0, bottom: 0),
      child: SizedBox(
        height: 58,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                if (showLeadingButton)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      iconSize: 38,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      color: Colors.pink.shade300,
                      onPressed: onLeadingButtonPressed,
                      icon: leadingButtonIcon!,
                    ),
                  ),
                if (showTitle)
                  Align(
                    alignment: Alignment.center,
                    child: LargeText(text: title),
                  ),
                if (showTrailingButton)
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      iconSize: 40,
                      color: Colors.pink.shade300,
                      onPressed: onTrailingButtonPressed,
                      icon: trailingButtonIcon!,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
