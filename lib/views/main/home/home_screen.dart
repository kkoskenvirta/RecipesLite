import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/views/main/home/home_body.dart';
import 'package:flutter_e_commerce/widgets/header/header.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../widgets/search_modal/search_modal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            const SizedBox(
              height: 20,
            ),
            HomePageBody()
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Header(
      title: "Home",
      leadingButtonIcon: Icon(Icons.search),
      onLeadingButtonPressed: () => showBarModalBottomSheet(
        expand: true,
        context: context,
        backgroundColor: Colors.white,
        builder: (context) => const SearchModal(),
      ),
      trailingButtonIcon: Icon(
        Icons.add_box,
      ),
      onTrailingButtonPressed: () {
        Navigator.pushNamed(context, Routes.recipeCreator.name);
      },
    );
  }
}
