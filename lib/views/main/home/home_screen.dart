import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/views/main/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  HomePageBody(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
