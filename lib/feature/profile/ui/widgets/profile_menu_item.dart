import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/widget/custom_card.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? subtitle;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    super.key,
    this.onTap,
    this.subtitle,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      isColumn: false,
      padding: AppSpacing.sm,
      color: AppColors.background.withValues(alpha: 0.8),
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: .circle,
            color: AppColors.primary,
          ),
          child: Icon(icon, color: AppColors.background),
        ),
        SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .start,
            children: [
              Text(
                title,
                style: AppTypography.h6.copyWith(color: AppColors.textPrimary),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(subtitle!, style: AppTypography.bodySmall),
              ],
            ],
          ),
        ),
        Icon(Icons.chevron_right, color: AppColors.textSecondary),
      ],
    );
  }
}
