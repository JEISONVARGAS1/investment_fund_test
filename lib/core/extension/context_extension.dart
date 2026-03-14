import 'package:flutter/material.dart';
import 'package:investment_fund/core/util/constants.dart';

extension ContextExtension on BuildContext {

  bool get isMobile => MediaQuery.sizeOf(this).width < mobile;

  bool get isDesktop => MediaQuery.sizeOf(this).width >= desktop;

  bool get isTabletOrLarger => MediaQuery.sizeOf(this).width >= mobile;

  double get horizontalPadding {
    final width = MediaQuery.sizeOf(this).width;
    if (width >= desktop) return 32;
    if (width >= mobile) return 24;
    return 16;
  }

  int get gridCrossAxisCount {
    final width = MediaQuery.sizeOf(this).width;
    if (width >= desktop) return 3;
    if (width >= mobile) return 3;
    return 2;
  }
}
