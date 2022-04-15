import 'package:flutter/material.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class CustomIconButton extends StatelessWidget {
  final function;
  final Widget icon;
  const CustomIconButton({required this.icon, required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(5),
        ),
        child: icon,
      ),
    );
  }
}
