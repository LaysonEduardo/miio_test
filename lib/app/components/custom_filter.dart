import 'package:flutter/material.dart';
import 'package:miio_test/core/config/app_palettes.dart';

// ignore: must_be_immutable
class CustomFilter extends StatefulWidget implements PreferredSizeWidget {
  String? currentValue;
  final ValueChanged<String>? onTap;

  CustomFilter({required this.onTap, this.currentValue});

  @override
  State<CustomFilter> createState() => _CustomFilterState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomFilterState extends State<CustomFilter> {
  final List<String> options = ['Art', 'Buy now', 'Auction', 'Overall', 'Price'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 45,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: options.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    widget.onTap?.call(options[index]);
                    setState(() {
                      widget.currentValue == options[index] ? widget.currentValue = null : widget.currentValue = options[index];
                    });
                  },
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 100,
                      minWidth: 70,
                    ),
                    decoration: BoxDecoration(
                      color: widget.currentValue == options[index] ? AppColors.accent.withOpacity(0.1) : Colors.transparent,
                      border: Border.all(
                        color: widget.currentValue == options[index] ? AppColors.accent : AppColors.lightGrey,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      widthFactor: 2,
                      child: Text(
                        options[index],
                        style: TextStyle(
                          color: widget.currentValue == options[index] ? Colors.black : AppColors.lightGrey,
                          fontSize: 16,
                          fontWeight: widget.currentValue == options[index] ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
