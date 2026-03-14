import 'package:flutter/material.dart';
import 'package:investment_fund/core/util/constants.dart';
import 'package:investment_fund/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

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
    if (width >= desktop) return 4;
    if (width >= mobile) return 3;
    return 2;
  }
}
