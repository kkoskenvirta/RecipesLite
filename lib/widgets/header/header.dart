import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/widgets/large_text.dart';
import 'package:flutter_e_commerce/widgets/search_modal/search_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.title,
    this.showLeftButton = true,
    this.showRightButton = true,
    this.showTitle = true,
  }) : super(key: key);

  final String title;
  final bool showLeftButton;
  final bool showRightButton;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            if (showLeftButton)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  iconSize: 38,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.pink.shade300,
                  onPressed: () => showBarModalBottomSheet(
                      expand: true,
                      context: context,
                      backgroundColor: Colors.white,
                      builder: (context) => const SearchModal()),
                  icon: Icon(Icons.search),
                ),
              ),
            if (showTitle)
              Align(
                alignment: Alignment.center,
                child: LargeText(text: title),
              ),
            if (showRightButton)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  iconSize: 42,
                  color: Colors.pink.shade300,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.recipeCreator.name);
                  },
                  icon: Icon(Icons.add_box_rounded),
                ),
              )
          ],
        ),
      ],
    );
  }
}
