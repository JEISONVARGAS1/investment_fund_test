import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/widget/custom_search.dart';
import 'package:investment_fund/core/widget/investment_charts.dart';
import 'package:investment_fund/core/widget/responsive_container.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/widget/custom_parent_container.dart';
import 'package:investment_fund/feature/stocks/ui/widgets/my_actions.dart';
import 'package:investment_fund/feature/stocks/ui/widgets/market_trends.dart';
import 'package:investment_fund/feature/stocks/provider/stock_controller.dart';

class StocksPage extends ConsumerStatefulWidget {
  const StocksPage({super.key});
  @override
  ConsumerState<StocksPage> createState() => _StocksPageState();
}

class _StocksPageState extends ConsumerState<StocksPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => ref.read(stockControllerProvider.notifier).initPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(stockControllerProvider).value!;
    final controller = ref.read(stockControllerProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: ResponsiveContainer(
            child: Padding(
              padding: .all(context.horizontalPadding),
              child: Column(
                spacing: AppSpacing.lg,
                crossAxisAlignment: .start,
                children: [
                  CustomSearch(onChanged: controller.searchInvestmentsFunds),
                  InvestmentCharts(),
                  CustomParentContainer(
                    children: [
                      MyActions(
                        funds: state.filteredInvestmentsFunds,
                        onTap: (fund) => context.push(
                          '/lobby/investment/${fund.name}',
                          extra: fund,
                        ),
                      ),
                      MarketTrends(
                        funds: state.filteredInvestmentsFunds,
                        onTap: (fund) => context.push(
                          '/lobby/investment/${fund.name}',
                          extra: fund,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
