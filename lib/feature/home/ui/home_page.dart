import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/widget/responsive_container.dart';
import 'package:investment_fund/feature/home/provider/home_controller.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_item_card.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_mobil_header.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_scroll_view_header.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_item_card_gridview.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_web_header.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final provider = ref.read(homeControllerProvider.notifier);
      provider.initPage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  crossAxisAlignment: .start,
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
                            5,
                            (index) => CustomItemCard(
                              title: 'Apple',
                              icon: Icons.apple,
                              subtitle: '10 unit',
                              price: '\$2.300.00',
                              percentage: '+\$10.00 (10%)',
                              onTap: () => context.push('/investment/Apple'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSpacing.lg),
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
                            final crossAxisCount = context.gridCrossAxisCount;
                            return GridView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    childAspectRatio: 1.1,
                                  ),
                              itemBuilder: (context, index) =>
                                  CustomItemCardGridview(
                                    title: 'Apple',
                                    icon: Icons.apple,
                                    subtitle: '10 unit',
                                    percentage: '+\$10.00 (10%)',
                                    onTap: () =>
                                        context.push('/investment/Apple'),
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
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
