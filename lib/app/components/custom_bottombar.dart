import 'package:flutter/material.dart';
import 'package:miio_test/app/components/buttons/custom_menu_button.dart';

class CustomBottomBar extends StatelessWidget {
  final int currenIndex;
  final ValueChanged<int>? onTap;
  final List<CustomMenuButton> items;
  const CustomBottomBar({required this.currenIndex, required this.onTap, required this.items});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50,
        color: Colors.white,
        child: Row(
          children: List.generate(items.length, (index) {
            return Expanded(
              child: InkWell(
                onTap: () {
                  onTap?.call(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: currenIndex == index ? 30 : 25,
                  child: currenIndex == index ? items[index].activeIcon : items[index].icon,
                ),
              ),
            );
          }),
          //[

          //],
        ),
      ),
    );
  }
}
