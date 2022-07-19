import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/routes/route_service.dart';

import 'package:flutter_e_commerce/views/main/home/home_body.dart';
import 'package:flutter_e_commerce/widgets/search_modal/search_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
              height: 10,
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
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.profile.name);
                },
                tooltip: "User profile",
                icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.pink.shade400,
                  size: 36,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => showBarModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.white,
                builder: (context) => const SearchModal()),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.pink.shade300),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
