import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/widget/custom_search.dart';
import 'package:investment_fund/core/widget/investment_charts.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/widget/responsive_container.dart';
import 'package:investment_fund/core/widget/custom_parent_container.dart';
import 'package:investment_fund/feature/home/provider/home_controller.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_item_card.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_web_header.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_mobil_header.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_scroll_view_header.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_item_card_gridview.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => ref.read(homeControllerProvider.notifier).initPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeControllerProvider).value!;
    final provider = ref.read(homeControllerProvider.notifier);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          CustomScrollViewHeader(
            isDesktop: context.isDesktop,
            child: context.isDesktop ? CustomWebHeader() : CustomMobilHeader(),
          ),
          SliverToBoxAdapter(
            child: ResponsiveContainer(
              child: Padding(
                padding: .all(context.horizontalPadding),
                child: Column(
                  spacing: AppSpacing.lg,
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    CustomSearch(),
                    CustomParentContainer(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        CustomCard(
                          children: [
                            Text(
                              'Mis bienes',
                              style: AppTypography.h3.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Column(
                              children: List.generate(
                                state.filteredInvestmentsFunds.length,
                                (index) {
                                  final fund =
                                      state.filteredInvestmentsFunds[index];
                                  return CustomItemCardGridview(
                                    fund: fund,
                                    onTap: (name) =>
                                        context.push('/investment/$name'),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        CustomCard(
                          children: [
                            Text(
                              'Choices Of Analysts',
                              style: AppTypography.h3.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return GridView.builder(
                                  padding: .zero,
                                  shrinkWrap: true,
                                  itemCount:
                                      state.filteredInvestmentsFunds.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 1,
                                        crossAxisCount:
                                            context.gridCrossAxisCount,
                                      ),
                                  itemBuilder: (context, index) =>
                                      CustomItemCardGridview(
                                        fund: state
                                            .filteredInvestmentsFunds[index],
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

                    InvestmentCharts(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
