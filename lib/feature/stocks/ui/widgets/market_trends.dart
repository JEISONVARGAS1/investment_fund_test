import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/widget/empty_widget.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/widget/custom_item_card_gridview.dart';

class MarketTrends extends StatelessWidget {
  final List<FundModel> funds;
  final Function(FundModel fund) onTap;
  const MarketTrends({super.key, required this.funds, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      children: [
        Text(
          'Tendencias del mercado',
          style: AppTypography.h3.copyWith(
            fontWeight: .w600,
            color: AppColors.textPrimary,
          ),
        ),
        EmptyWidget(
          isEmpty: funds.isEmpty,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = context.gridCrossAxisCount;
              return GridView.builder(
                padding: .zero,
                shrinkWrap: true,
                itemCount: funds.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: crossAxisCount,
                ),
                itemBuilder: (_, index) => CustomItemCardGridview(
                  fund: funds[index],
                  onTap: (fund) => onTap(fund),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
