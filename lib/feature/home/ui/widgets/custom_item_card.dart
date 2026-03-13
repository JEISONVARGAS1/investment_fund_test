import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class CustomItemCard extends StatelessWidget {
  final String title;
  final String price;
  final IconData icon;
  final String subtitle;
  final String percentage;
  final Function()? onTap;
  const CustomItemCard({
    super.key,
    required this.icon,
    required this.title,
    required this.price,
    required this.subtitle,
    required this.percentage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      isColumn: false,
      padding: AppSpacing.sm,
      color: AppColors.background.withOpacity(0.8),
      children: [
        Container(
          padding: .all(10),
          decoration: BoxDecoration(shape: .circle, color: AppColors.primary),
          child: Icon(icon, color: AppColors.background),
        ),
        SizedBox(width: AppSpacing.sm),
        Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          children: [
            Text(
              title,
              style: AppTypography.h6.copyWith(color: AppColors.textPrimary),
            ),
            Text(subtitle, style: AppTypography.bodySmall),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: .end,
          mainAxisAlignment: .center,
          children: [
            Text(
              price,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            Text(percentage, style: AppTypography.bodySmall),
          ],
        ),
      ],
    );
  }
}
