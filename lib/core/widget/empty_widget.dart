import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';

class EmptyWidget extends StatelessWidget {
  final bool isEmpty;
  final Widget child;

  const EmptyWidget({super.key, required this.isEmpty, required this.child});

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              mainAxisSize: MainAxisSize.max,
              spacing: AppSpacing.sm,
              children: [
                SizedBox(height: 100),
                Icon(Icons.search_off_outlined, size: 40),
                Text('No hay datos disponibles'),
              ],
            ),
          )
        : child;
  }
}
