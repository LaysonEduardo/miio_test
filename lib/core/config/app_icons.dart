import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static posts({Color? color}) {
    return SvgPicture.asset(
      'assets/icons/posts.svg',
      color: color,
      fit: BoxFit.scaleDown,
    );
  }

  static shop({Color? color}) {
    return SvgPicture.asset(
      'assets/icons/shop.svg',
      color: color,
      fit: BoxFit.scaleDown,
    );
  }

  static person({Color? color}) {
    return SvgPicture.asset(
      'assets/icons/person.svg',
      color: color,
      fit: BoxFit.scaleDown,
    );
  }

  static heart({Color? color}) {
    return SvgPicture.asset(
      'assets/icons/heart.svg',
      color: color,
      fit: BoxFit.scaleDown,
      height: 5,
    );
  }

  static back({Color? color}) {
    return SvgPicture.asset(
      'assets/icons/back.svg',
      color: color,
      fit: BoxFit.scaleDown,
    );
  }

  static world({Color? color}) {
    return SvgPicture.asset(
      'assets/icons/world.svg',
      color: color,
      fit: BoxFit.scaleDown,
    );
  }

  static brush({Color? color}) {
    return SvgPicture.asset(
      'assets/icons/brush.svg',
      color: color,
      fit: BoxFit.scaleDown,
    );
  }

  static measurement({Color? color}) {
    return SvgPicture.asset(
      'assets/icons/measurement.svg',
      color: color,
      fit: BoxFit.scaleDown,
    );
  }
}
