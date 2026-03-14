import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/widget/custom_card.dart';

class CustomSmallCardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;


  const CustomSmallCardItem({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      color: color,
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        Icon(icon, color: AppColors.surface),
        Text(
          title,
          style: AppTypography.bodySmall.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.surface,
          ),
        ),
      ],
    );
  }
}
