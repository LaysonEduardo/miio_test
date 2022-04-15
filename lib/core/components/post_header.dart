import 'package:flutter/material.dart';
import 'package:miio_test/core/components/post_info.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class PostHeader extends StatelessWidget {
  final String title;
  final String description;
  const PostHeader({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        PostInfo(),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            height: 1.5,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
