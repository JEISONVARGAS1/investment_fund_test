import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/model/user_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class DetailActionButtons extends ConsumerWidget {
  final FundModel fund;
  final UserModel user;
  final Function() onBuy;
  final Function() onSell;
  const DetailActionButtons({
    super.key,
    required this.fund,
    required this.user,
    required this.onBuy,
    required this.onSell,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final isInvested = user.investments.contains(fund.id.toString());
    return Padding(
      padding: .symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          if (!isInvested)
            Expanded(
              child: _ActionButton(
                onTap: onBuy,
                label: 'Comprar',
                color: AppColors.success,
              ),
            ),
          if (isInvested)
            Expanded(
              child: _ActionButton(
                onTap: onSell,
                label: 'Vender',
                color: AppColors.secondaryLight,
              ),
            ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.2),
      borderRadius: .circular(AppSpacing.radiusMd),
      child: InkWell(
        onTap: onTap,
        borderRadius: .circular(AppSpacing.radiusMd),
        child: Container(
          alignment: .center,
          padding: .symmetric(vertical: AppSpacing.md),
          child: Text(
            label,
            style: AppTypography.button.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
