import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class CustomItemCard extends StatelessWidget {
  final FundModel fund;
  final Function(String name)? onTap;
  const CustomItemCard({super.key, required this.fund, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () => onTap?.call(fund.name),
      isColumn: false,
      padding: AppSpacing.sm,
      color: AppColors.background.withOpacity(0.8),
      children: [
        Container(
          padding: .all(10),
          decoration: BoxDecoration(shape: .circle, color: AppColors.primary),
          child: Icon(fund.iconData, color: AppColors.background),
        ),
        SizedBox(width: AppSpacing.sm),
        Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .start,
          children: [
            Text(
              fund.name,
              style: AppTypography.h6.copyWith(color: AppColors.textPrimary),
            ),
            Text(fund.type, style: AppTypography.bodySmall),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: .end,
          mainAxisAlignment: .center,
          children: [
            Text(
              fund.minInvestment.toString(),
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            Text(fund.profitProbability, style: AppTypography.bodySmall),
          ],
        ),
      ],
    );
  }
}
