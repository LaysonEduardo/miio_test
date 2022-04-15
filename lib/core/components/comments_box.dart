import 'dart:math';

import 'package:flutter/material.dart';
import 'package:miio_test/core/components/rating.dart';
import 'package:miio_test/app/modules/configuration/models/comment_model.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class CommentsBox extends StatelessWidget {
  final List<CommentModel> comments;
  const CommentsBox({required this.comments});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              'Comments',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              itemCount: comments.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.underGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Rating(rating: Random().nextInt(5)),
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            comments[index].body,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            text: 'Review by ',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: comments[index].email,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
