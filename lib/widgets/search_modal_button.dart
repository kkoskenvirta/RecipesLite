import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/widgets/search_modal/search_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SearchModalButton extends StatelessWidget {
  const SearchModalButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showBarModalBottomSheet(
          expand: true, context: context, backgroundColor: Colors.white, builder: (context) => const SearchModal()),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.pink.shade300),
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
