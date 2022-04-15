import 'package:flutter/material.dart';
import 'package:miio_test/core/components/post_info.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class PostHeader extends StatelessWidget {
  final String? title;
  final String? description;
  const PostHeader({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Annie Rokae Art, purple, pink and blue paint.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        PostInfo(),
        Text(
          'The formal relationships of thick with thin lines, of broken with continuous, and of sinuous with jagged are forces of contrast and repetition in the design. Variations in the painted contours of images also provide a direct method of describing the volume, weight, spatial position, light, and textural characteristics of things.',
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
