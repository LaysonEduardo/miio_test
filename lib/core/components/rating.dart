import 'package:flutter/material.dart';
import 'package:miio_test/core/config/app_icons.dart';

class Rating extends StatelessWidget {
  final int rating;
  const Rating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          spacing: 5,
          children: List.generate(5, (index) {
            return rating - 1 >= index ? AppIcons.starSelected() : AppIcons.star();
          }),
        ),
      ],
    );
  }
}
