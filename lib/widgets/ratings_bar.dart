import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/widgets/small_text.dart';

class RatingsRow extends StatelessWidget {
  final double ratingScore;
  final int commentCount;

  const RatingsRow(
      {Key? key, required this.ratingScore, required this.commentCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          children: List.generate(
              5,
              (index) => Icon(
                    Icons.star,
                    color: Colors.pink.shade200,
                    size: 14,
                  )),
        ),
        const SizedBox(width: 12),
        SmallText(text: ratingScore.toString()),
        const SizedBox(width: 12),
        SmallText(text: commentCount.toString()),
        const SizedBox(width: 4),
        SmallText(text: commentCount > 1 ? "Comments" : "Comment"),
      ],
    );
  }
}
