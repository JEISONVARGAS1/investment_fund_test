import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/model/fund_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/widget/responsive_container.dart';
import 'package:investment_fund/feature/investment_detail/ui/widgets/detail_info_card.dart';
import 'package:investment_fund/feature/investment_detail/ui/widgets/detail_action_buttons.dart';
import 'package:investment_fund/feature/investment_detail/ui/widgets/detail_candlestick_chart.dart';
import 'package:investment_fund/feature/investment_detail/provider/investment_detail_controller.dart';
import 'package:investment_fund/feature/investment_detail/ui/widgets/custom_investment_detail_header.dart';

class InvestmentDetailPage extends ConsumerStatefulWidget {
  final FundModel fund;

  const InvestmentDetailPage({super.key, required this.fund});

  @override
  ConsumerState<InvestmentDetailPage> createState() =>
      _InvestmentDetailPageState();
}

class _InvestmentDetailPageState extends ConsumerState<InvestmentDetailPage> {

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(investmentDetailControllerProvider.notifier).initPage(widget.fund);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(investmentDetailControllerProvider).value!;
    final controller = ref.read(investmentDetailControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Column(
          children: [
            CustomInvestmentDetailHeader(
              fund: state.fund,
              onBack: () => context.pop(),
            ),
            ResponsiveContainer(
              child: Padding(
                padding: .all(context.horizontalPadding),
                child: Column(
                  spacing: AppSpacing.lg,
                  crossAxisAlignment: .stretch,
                  children: [
                    CustomCard(
                      color: AppColors.cardSurface,
                      children: [DetailCandlestickChart()],
                    ),
                    DetailInfoCard(fund: state.fund, color: AppColors.cardSurface),
                    DetailActionButtons(
                      fund: state.fund,
                      user: state.user,
                      onBuy: () => controller.buyAction(context),
                      onSell: () => controller.sellAction(context),
                    ),
                    SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
