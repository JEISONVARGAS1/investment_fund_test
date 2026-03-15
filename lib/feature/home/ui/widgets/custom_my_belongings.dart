import 'package:flutter/material.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/widget/empty_widget.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/widget/custom_item_card.dart';

class CustomMyBelongings extends StatelessWidget {
  final Function(FundModel fund)? onTap;

  final List<FundModel> fundsList;
  const CustomMyBelongings({
    super.key,
    required this.onTap,
    required this.fundsList,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: context.isDesktop ? 400 : null,
      children: [
        Text('Mis bienes', style: AppTypography.h3.copyWith(fontWeight: .w600)),
        EmptyWidget(
          isEmpty: fundsList.isEmpty,
          child: Column(
            children: List.generate(
              fundsList.length,
              (index) => CustomItemCard(
                fund: fundsList[index],
                onTap: (fund) => onTap?.call(fund),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
