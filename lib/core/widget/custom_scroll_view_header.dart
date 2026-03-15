import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';

class CustomScrollViewHeader extends StatelessWidget {
  final Widget child;
  final bool isDesktop;

  const CustomScrollViewHeader({
    super.key,
    required this.child,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final expandedHeight = isDesktop ? 300.0 : 200.0;

    return SliverAppBar(
      expandedHeight: expandedHeight,
      floating: true,
      pinned: true,
      stretch: true,
      actions: [
        Container(
          padding: .all(10),
          margin: .only(right: 10),
          decoration: BoxDecoration(
            shape: .circle,
            color: AppColors.primaryDark,
          ),
          child: Icon(Icons.notifications),
        ),
      ],
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        stretchModes: const [.fadeTitle, .blurBackground, .zoomBackground],
        background: Container(
          decoration: BoxDecoration(
            borderRadius: isDesktop ? null :.only(bottomLeft: .circular(100)),
            gradient: LinearGradient(
              begin: .topLeft,
              end: .bottomRight,
              colors: [
                AppColors.primary,
                AppColors.primaryDark,
                AppColors.secondaryDark,
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
