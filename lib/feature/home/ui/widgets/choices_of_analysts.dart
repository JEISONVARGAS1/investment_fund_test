import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/widget/empty_widget.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/widget/custom_item_card_gridview.dart';

class ChoicesOfAnalysts extends StatelessWidget {
  final List<FundModel> funds;
  final Function(FundModel fund) onTap;
  const ChoicesOfAnalysts({
    super.key,
    required this.funds,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: context.isDesktop ? 400 : null,
      children: [
        Text(
          'Opciones de analistas',
          style: AppTypography.h3.copyWith(fontWeight: .w600),
        ),

        EmptyWidget(
          isEmpty: funds.isEmpty,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                padding: .zero,
                shrinkWrap: true,
                itemCount: funds.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: context.gridCrossAxisCount,
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
