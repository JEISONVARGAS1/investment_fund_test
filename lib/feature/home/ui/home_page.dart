import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/feature/home/provider/home_controller.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_header.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_item_card.dart';

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
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          CustomHeader(
            children: [
              SizedBox(height: 10),
              Container(
                alignment: .center,
                child: Text(
                  'Investment',
                  style: AppTypography.h4.copyWith(color: AppColors.background),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Broker account',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.background,
                      ),
                    ),
                    Text(
                      '\$8 900.16',
                      style: AppTypography.h1.copyWith(
                        color: AppColors.background,
                      ),
                    ),
                    Text(
                      '+\$800.14 (10%)',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.background,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const .all(8),
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
                          10,
                          (index) => CustomItemCard(
                            onTap: () {},
                            title: 'Apple',
                            icon: Icons.apple,
                            subtitle: '10 unit',
                            price: '\$2.300.00',
                            percentage: '+\$10.00 (10%)',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
