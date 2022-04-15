import 'package:flutter/material.dart';
import 'package:miio_test/core/config/app_icons.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class PostInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              AppIcons.measurement(color: AppColors.grey),
              const Text(
                '61 W X 41.3 H',
                style: TextStyle(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              AppIcons.brush(color: AppColors.grey),
              const Text(
                'Oil and Acrilic',
                style: TextStyle(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              AppIcons.world(color: AppColors.grey),
              const Text(
                'Germany',
                style: TextStyle(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
