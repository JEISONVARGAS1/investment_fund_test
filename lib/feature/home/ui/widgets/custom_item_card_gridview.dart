import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/widget/custom_card.dart';

class CustomItemCardGridview extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subtitle;
  final String percentage;
  final Function()? onTap;
  const CustomItemCardGridview({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.percentage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      color: AppColors.background.withOpacity(0.8),
      children: [
        Row(
          children: [
            Container(
              padding: .all(3),
              decoration: BoxDecoration(
                shape: .circle,
                color: AppColors.primary,
              ),
              child: Icon(
                icon,
                size: AppSpacing.md,
                color: AppColors.background,
              ),
            ),
            SizedBox(width: AppSpacing.sm),
            Text(
              title,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        Container(
          width: double.infinity,
          height: 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/metric.png'),
              fit: .fitWidth,
            ),
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: .end,
            crossAxisAlignment: .end,
            children: [
              Text(
                percentage,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.success,
                ),
              ),
              SizedBox(width: AppSpacing.sm),
              Text(
                subtitle,
                textAlign: .end,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
