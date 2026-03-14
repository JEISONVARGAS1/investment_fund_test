import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_breakpoints.dart';
import 'package:investment_fund/core/theme/app_colors.dart';

class CustomHeader extends StatelessWidget {
  final List<Widget> children;
  const CustomHeader({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final expandedHeight = AppBreakpoints.isDesktop(context) ? 280.0 : 200.0;

    return SliverAppBar(
      expandedHeight: expandedHeight,
      floating: true,
      pinned: true,
      stretch: true,
      actions: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryDark,
          ),
          child: Icon(Icons.notifications),
        ),
      ],
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        stretchModes: const [
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primary,
                AppColors.primaryDark,
                AppColors.secondaryDark,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: children,
          ),
        ),
      ),
    );
  }
}
