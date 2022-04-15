import 'package:flutter/material.dart';
import 'package:miio_test/core/components/rating.dart';
import 'package:miio_test/app/modules/configuration/models/comments_model.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class CommentsBox extends StatelessWidget {
  final List<CommentsModel>? comments;
  const CommentsBox({this.comments});

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
              itemCount: 10,
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
                    children: const [
                      Rating(rating: 1),
                      ListTile(
                        title: Text('teste'),
                        subtitle: Text('teste'),
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
