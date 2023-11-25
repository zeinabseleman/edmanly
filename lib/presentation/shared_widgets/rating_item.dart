import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingItem extends StatelessWidget {
  final int rate;

  const RatingItem({super.key, required this.rate});
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      unratedColor: Colors.grey,
      initialRating: rate.toDouble(),
      ignoreGestures: true,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 8,
      itemPadding:
      const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.yellowAccent,
      ),
      onRatingUpdate: (rating) {
        if (kDebugMode) {
        }
      },
    );
  }
}
