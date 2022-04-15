import 'package:flutter/material.dart';
import 'package:miio_test/app/modules/configuration/models/user_model.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  const UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      constraints: const BoxConstraints(
        maxHeight: 80,
        maxWidth: 450,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.underGrey,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            user.image,
          ),
        ),
        title: Text(user.name),
        subtitle: Text(user.company),
      ),
    );
  }
}
