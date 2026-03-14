import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/widget/custom_card.dart';

class DetailInfoCard extends StatelessWidget {
  final String title;
  final String price;
  final IconData icon;

  const DetailInfoCard({
    super.key,
    required this.title,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      children: [
        Row(
          children: [
            Container(
              padding: .all(5),
              decoration: BoxDecoration(
                shape: .circle,
                color: AppColors.primary,
              ),
              child: Icon(
                Icons.apple,
                size: AppSpacing.md,
                color: AppColors.background,
              ),
            ),
            SizedBox(width: AppSpacing.sm),
            Text(
              title,
              style: AppTypography.h5.copyWith(color: AppColors.textPrimary),
            ),
            Spacer(),
            Row(
              children: [
                Icon(
                  Icons.arrow_upward,
                  size: AppSpacing.md,
                  color: AppColors.success,
                ),
                Text(
                  '+10%',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          price,
          style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
        ),

        const SizedBox(height: AppSpacing.lg),
        Row(
          children: [
            Expanded(
              child: _InfoColumn(
                label: 'UPCOMING EARNINGS',
                value: 'Aug 27',
                subLabel: 'EPS',
                subValue: '40,88',
              ),
            ),
            Expanded(
              child: _InfoColumn(
                label: 'MARKET CAP',
                value: '4437.94B',
                subLabel: 'DIV YIELD',
                subValue: '2,03%',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  final String subLabel;
  final String subValue;

  const _InfoColumn({
    required this.label,
    required this.value,
    required this.subLabel,
    required this.subValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subLabel,
          style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
        ),
        Text(
          subValue,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
