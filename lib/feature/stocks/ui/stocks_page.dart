import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/widget/custom_search.dart';
import 'package:investment_fund/core/widget/investment_charts.dart';
import 'package:investment_fund/core/widget/responsive_container.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/widget/custom_parent_container.dart';
import 'package:investment_fund/feature/stocks/provider/stock_controller.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_item_card_gridview.dart';

class StocksPage extends ConsumerStatefulWidget {
  const StocksPage({super.key});
  @override
  ConsumerState<StocksPage> createState() => _StocksPageState();
}

class _StocksPageState extends ConsumerState<StocksPage> {
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
                  CustomSearch(),
                  InvestmentCharts(),
                  CustomParentContainer(
                    children: [
                      CustomCard(
                        children: [
                          Text(
                            'Mis acciones',
                            style: AppTypography.h3.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Column(
                            children: List.generate(
                              5,
                              (index) => CustomItemCardGridview(
                                fund: state.filteredInvestmentsFunds[index],
                                onTap: (name) =>
                                    context.push('/investment/$name'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      CustomCard(
                        children: [
                          Text(
                            'Tendencias del mercado',
                            style: AppTypography.h3.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final crossAxisCount = context.gridCrossAxisCount;
                              return GridView.builder(
                                itemCount: 5,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: crossAxisCount,
                                      childAspectRatio: 1,
                                    ),
                                itemBuilder: (context, index) =>
                                    CustomItemCardGridview(
                                      fund:
                                          state.filteredInvestmentsFunds[index],
                                      onTap: (name) =>
                                          context.push('/investment/$name'),
                                    ),
                              );
                            },
                          ),
                        ],
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
