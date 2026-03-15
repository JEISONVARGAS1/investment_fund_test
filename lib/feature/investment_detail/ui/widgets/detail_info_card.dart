import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/util/money_format.dart';
import 'package:investment_fund/core/widget/custom_card.dart';

class DetailInfoCard extends StatelessWidget {
  final Color? color;
  final FundModel fund;

  const DetailInfoCard({super.key, required this.fund, this.color});

  @override
  Widget build(BuildContext context) {
    final probabilityPercent =
        (double.tryParse(fund.profitProbability) ?? 0) * 100;

    return CustomCard(
      color: color,
      children: [
        Row(
          spacing: AppSpacing.sm,
          children: [
            Container(
              padding: .all(5),
              decoration: BoxDecoration(
                shape: .circle,
                color: AppColors.primary,
              ),
              child: Icon(
                fund.iconData,
                size: AppSpacing.md,
                color: AppColors.background,
              ),
            ),
            Expanded(
              child: Text(
                fund.name,
                maxLines: 1,
                overflow: .ellipsis,
                style: AppTypography.h5.copyWith(color: AppColors.textPrimary),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.trending_up,
                  size: AppSpacing.md,
                  color: AppColors.success,
                ),
                Text(
                  '${probabilityPercent.toStringAsFixed(0)}%',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          moneyFormat(fund.minInvestment.toDouble()),
          style: AppTypography.h3.copyWith(color: AppColors.textPrimary),
        ),
        const SizedBox(height: AppSpacing.lg),
        Row(
          children: [
            Expanded(
              child: _InfoColumn(
                label: 'TIPO',
                value: fund.type,
                subLabel: 'INVERSIÓN MÍNIMA',
                subValue: moneyFormat(fund.minInvestment.toDouble()),
              ),
            ),
            Expanded(
              child: _InfoColumn(
                label: 'MONEDA',
                value: fund.currency,
                subLabel: 'PROBABILIDAD',
                subValue: '${(probabilityPercent).toStringAsFixed(0)}%',
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
