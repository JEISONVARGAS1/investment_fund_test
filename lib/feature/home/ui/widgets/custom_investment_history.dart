import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:investment_fund/core/util/constants.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/util/money_format.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/widget/empty_widget.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/model/investment_record_model.dart';

class CustomInvestmentHistory extends StatelessWidget {
  final List<InvestmentRecordsModel> investmentRecords;

  const CustomInvestmentHistory({super.key, required this.investmentRecords});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: context.isDesktop ? 400 : null,
      children: [
        Text(
          'Historial',
          style: AppTypography.h3.copyWith(fontWeight: FontWeight.w600),
        ),
        EmptyWidget(
          isEmpty: investmentRecords.isEmpty,
          child: Column(
            children: List.generate(
              investmentRecords.length,
              (index) =>
                  _InvestmentRecordItem(record: investmentRecords[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class _InvestmentRecordItem extends StatelessWidget {
  final InvestmentRecordsModel record;

  const _InvestmentRecordItem({required this.record});

  FundModel _getFundById(int fundId) {
    try {
      return fundTypes.firstWhere((f) => f.id == fundId);
    } catch (_) {
      return FundModel.init().copyWith(name: 'Fondo #$fundId');
    }
  }

  String? _getProfitLossLabel() {
    if (!record.isSell || record.purchasePrice == null) return null;
    final salePrice = record.price.toDouble();
    final purchasePrice = record.purchasePrice!.toDouble();
    final difference = salePrice - purchasePrice;
    if (difference > 0) return 'Ganancia: ${moneyFormat(difference)}';
    if (difference < 0) return 'Pérdida: ${moneyFormat(-difference)}';
    return 'Sin cambio';
  }

  @override
  Widget build(BuildContext context) {
    final fund = _getFundById(record.fundId);
    final isSell = record.isSell;
    final profitLossLabel = _getProfitLossLabel();
    final hasLoss = isSell && record.price < record.purchasePrice!;
    final hasProfit = isSell && record.price > record.purchasePrice!;

    return CustomCard(
      isColumn: false,
      padding: AppSpacing.sm,
      color: AppColors.background.withOpacity(0.8),
      children: [
        Container(
          padding: .all(10),
          decoration: BoxDecoration(
            shape: .circle,
            color: _handledColor(isSell, hasProfit, hasLoss),
          ),
          child: Icon(
            _handledIcon(isSell, hasProfit, hasLoss),
            color: AppColors.background,
          ),
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
                overflow: TextOverflow.ellipsis,
                style: AppTypography.h6.copyWith(color: AppColors.textPrimary),
              ),
              Text(
                DateFormat('dd/MM/yyyy HH:mm', 'es').format(record.date),
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              if (profitLossLabel != null)
                Text(
                  profitLossLabel,
                  style: AppTypography.caption.copyWith(
                    fontWeight: .w600,
                    color: _handledColor(isSell, hasProfit, hasLoss),
                  ),
                ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .end,
          children: [
            Text(
              moneyFormat(record.price.toDouble()),
              style: AppTypography.bodySmall.copyWith(
                fontWeight: .w600,
                color: _handledColor(isSell, hasProfit, hasLoss),
              ),
            ),
            Text(
              isSell ? 'Venta' : 'Compra',
              style: AppTypography.caption.copyWith(
                color: _handledColor(isSell, hasProfit, hasLoss),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Color _handledColor(bool isSell, bool hasProfit, bool hasLoss) {
  if (isSell) {
    if (hasLoss) return AppColors.error;
    if (hasProfit) return AppColors.warning;
    return AppColors.textSecondary;
  }
  return AppColors.success;
}

IconData _handledIcon(bool isSell, bool hasProfit, bool hasLoss) {
  if (isSell) {
    if (hasLoss) return Icons.trending_down;
    if (hasProfit) return Icons.trending_up;
    return Icons.remove;
  }
  return Icons.trending_up;
}
