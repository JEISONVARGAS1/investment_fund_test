import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/widget/custom_search.dart';
import 'package:investment_fund/core/widget/investment_charts.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/widget/responsive_container.dart';
import 'package:investment_fund/core/widget/custom_parent_container.dart';
import 'package:investment_fund/feature/home/provider/home_controller.dart';
import 'package:investment_fund/core/widget/custom_scroll_view_header.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_investment_history.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_web_header.dart';
import 'package:investment_fund/feature/home/ui/widgets/choices_of_analysts.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_mobil_header.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_my_belongings.dart';

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
            child: context.isDesktop
                ? CustomWebHeader(user: state.user)
                : CustomMobilHeader(user: state.user),
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
                    CustomSearch(onChanged: provider.searchInvestmentsFunds),
                    CustomParentContainer(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        CustomMyBelongings(
                          fundsList: state.myFilteredInvestmentsFunds,
                          onTap: (fund) => context.push(
                            '/lobby/investment/${fund.name}',
                            extra: fund,
                          ),
                        ),
                        ChoicesOfAnalysts(
                          funds: state.filteredInvestmentsFunds,
                          onTap: (fund) => context.push(
                            '/lobby/investment/${fund.name}',
                            extra: fund,
                          ),
                        ),
                      ],
                    ),
                    CustomInvestmentHistory(
                      investmentRecords: state.user.investmentRecords,
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
