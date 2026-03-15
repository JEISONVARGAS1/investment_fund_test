import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/util/money_format.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class CustomItemCard extends StatelessWidget {
  final FundModel fund;
  final Function(FundModel fund)? onTap;
  const CustomItemCard({super.key, required this.fund, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () => onTap?.call(fund),
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
        Expanded(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .start,
            children: [
              Text(
                fund.name,
                maxLines: 1,
                overflow: .ellipsis,
                style: AppTypography.h6.copyWith(color: AppColors.textPrimary),
              ),
              Text(fund.type, style: AppTypography.bodySmall),
            ],
          ),
        ),
        Text(
          moneyFormat(fund.minInvestment.toDouble()),
          style: AppTypography.bodySmall.copyWith(fontWeight: .w600),
        ),
      ],
    );
  }
}
