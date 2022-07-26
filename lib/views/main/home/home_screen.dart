import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';
import 'package:flutter_e_commerce/views/main/home/home_body.dart';
import 'package:flutter_e_commerce/widgets/header/header.dart';

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
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 0, bottom: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Header(
        title: "Home",
        showLeadingButton: false,
        trailingButtonIcon: Icon(
          Icons.add_box,
        ),
        onTrailingButtonPressed: () {
          Navigator.pushNamed(context, Routes.recipeCreator.name);
        },
      ),
    );
  }
}
