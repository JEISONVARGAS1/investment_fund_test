import 'package:flutter/material.dart';
import 'package:investment_fund/core/util/constants.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double? maxWidth;

  const ResponsiveContainer({super.key, required this.child, this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= mobile) {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth ?? maxContentWidth),
          child: child,
        ),
      );
    }

    return child;
  }
}
