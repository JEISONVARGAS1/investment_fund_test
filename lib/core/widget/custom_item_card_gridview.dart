import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/util/constants.dart';
import 'package:investment_fund/core/widget/custom_card.dart';

class CustomItemCardGridview extends StatelessWidget {
  final FundModel fund;
  final Function(FundModel fund)? onTap;

  const CustomItemCardGridview({
    super.key,
    required this.fund,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () => onTap?.call(fund),
      color: AppColors.background.withOpacity(0.8),
      children: [
        Row(
          spacing: AppSpacing.sm,
          children: [
            Container(
              padding: .all(3),
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
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSpacing.sm),
        Expanded(
          child: Container(
            width: .infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: .fitWidth,
                image: AssetImage(metricImage),
              ),
            ),
          ),
        ),
        SizedBox(height: AppSpacing.sm),
        SizedBox(
          width: .infinity,
          child: Column(
            mainAxisAlignment: .end,
            crossAxisAlignment: .end,
            children: [
              Text(
                fund.profitProbability,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.success,
                ),
              ),
              SizedBox(width: AppSpacing.sm),
              Text(
                fund.type,
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
