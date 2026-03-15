import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class CustomInvestmentDetailHeader extends StatelessWidget {
  final FundModel fund;
  final VoidCallback onBack;

  const CustomInvestmentDetailHeader({
    super.key,
    required this.fund,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .infinity,
      padding: .symmetric(
        vertical: AppSpacing.md,
        horizontal: context.horizontalPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: .only(
          bottomLeft: .circular(AppSpacing.radiusXl),
          bottomRight: .circular(AppSpacing.radiusXl),
        ),
        gradient: LinearGradient(
          begin: .topLeft,
          end: .bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
            AppColors.secondaryDark,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Material(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: .circular(AppSpacing.radiusFull),
                  child: InkWell(
                    onTap: onBack,
                    borderRadius: .circular(AppSpacing.radiusFull),
                    child: Container(
                      padding: .all(10),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        padding: .all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: .circular(AppSpacing.radiusMd),
                        ),
                        child: Icon(
                          fund.iconData,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          fund.name,
                          style: AppTypography.h4.copyWith(
                            fontWeight: .bold,
                            color: Colors.white,
                          ),
                          overflow: .ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
