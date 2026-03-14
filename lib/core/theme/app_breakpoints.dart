import 'package:flutter/material.dart';

/// Breakpoints para diseño responsivo.
/// Mobile-first: los estilos base son para móvil.
class AppBreakpoints {
  AppBreakpoints._();

  /// Móvil: < 600px
  static const double mobile = 600;

  /// Tablet: 600 - 900px
  static const double tablet = 900;

  /// Desktop: > 900px
  static const double desktop = 900;

  /// Ancho máximo del contenido en desktop (evita que se estire infinitamente)
  static const double maxContentWidth = 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobile;

  static bool isTabletOrLarger(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= mobile;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktop;

  /// Padding horizontal según tamaño de pantalla
  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= desktop) return 32;
    if (width >= mobile) return 24;
    return 16;
  }

  /// Número de columnas para grids según tamaño
  static int gridCrossAxisCount(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= desktop) return 4;
    if (width >= mobile) return 3;
    return 2;
  }
}
