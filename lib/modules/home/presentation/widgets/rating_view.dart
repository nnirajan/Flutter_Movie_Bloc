import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  final double rating;

  const RatingView({
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 18,
          color: Colors.yellow,
        ),
        const SizedBox(width: 2),
        Text(
          maxLines: 1,
          "$rating / 10 IMDb",
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
