import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_breakpoints.dart';

/// Envuelve el contenido para que en web/desktop no se estire infinitamente
/// y quede centrado con un ancho máximo. En móvil no aplica restricción.
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double? maxWidth;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= AppBreakpoints.mobile) {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: maxWidth ?? AppBreakpoints.maxContentWidth,
          ),
          child: child,
        ),
      );
    }

    return child;
  }
}
