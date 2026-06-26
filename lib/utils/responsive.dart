import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;

  bool get isSmall => screenWidth < 600;
  bool get isMedium => screenWidth >= 600 && screenWidth < 900;
  bool get isLarge => screenWidth >= 900;

  bool get isTablet => screenWidth >= 600;

  double get responsivePadding => isSmall ? 16 : isMedium ? 24 : 32;
  double get responsiveIconSize => isSmall ? 64 : 80;
  double get responsiveCardPadding => isSmall ? 16 : 24;

  T responsiveValue<T>({required T small, T? medium, T? large}) {
    if (isLarge && large != null) return large;
    if (isMedium && medium != null) return medium;
    return small;
  }
}
