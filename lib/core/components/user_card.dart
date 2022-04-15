import 'package:flutter/material.dart';
import 'package:miio_test/app/modules/configuration/models/users_model.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class UserCard extends StatelessWidget {
  final UsersModel? user;
  const UserCard({this.user});

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
      child: const ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
          ),
        ),
        title: Text('Bonnie Lybaert'),
        subtitle: Text('Betterpaint Real Deals'),
      ),
    );
  }
}
