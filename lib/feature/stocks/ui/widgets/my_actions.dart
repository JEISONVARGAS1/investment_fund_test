import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/widget/empty_widget.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/widget/custom_item_card.dart';
import 'package:investment_fund/core/extension/context_extension.dart';

class MyActions extends StatelessWidget {
  final List<FundModel> funds;
  final Function(FundModel fund) onTap;
  const MyActions({super.key, required this.funds, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: context.isDesktop ? 400 : null,
      children: [
        Text(
          'Top 5 acciones',
          style: AppTypography.h3.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        EmptyWidget(
          isEmpty: funds.isEmpty,
          child: Column(
            children: List.generate(
              funds.length,
              (index) => CustomItemCard(fund: funds[index], onTap: onTap),
            ),
          ),
        ),
      ],
    );
  }
}
