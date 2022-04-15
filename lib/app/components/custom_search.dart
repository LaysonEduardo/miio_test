import 'package:flutter/material.dart';
import 'package:miio_test/app/components/custom_filter.dart';
import 'package:miio_test/core/config/app_palettes.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final CustomFilter filter;

  const CustomSearchBar({this.height = kToolbarHeight, required this.filter});

  @override
  Size get preferredSize => const Size.fromHeight(135);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 40, maxWidth: 450),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.lightGrey, width: 1.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintStyle: const TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  hintText: 'Search',
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          filter,
        ],
      ),
    );
  }
}
