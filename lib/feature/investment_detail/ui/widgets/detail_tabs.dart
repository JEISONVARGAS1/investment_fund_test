import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/feature/investment_detail/provider/investment_detail_controller.dart';

class DetailTabs extends ConsumerWidget {
  final List<String> tabs;

  const DetailTabs({super.key, required this.tabs});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(investmentDetailControllerProvider).value?.selectedTab ?? 'Overview';

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: tabs.map((tab) {
          final isSelected = tab == selectedTab;
          return GestureDetector(
            onTap: () => ref.read(investmentDetailControllerProvider.notifier).setSelectedTab(tab),
            child: Container(
              margin: const EdgeInsets.only(right: 24),
              padding: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                tab,
                style: AppTypography.bodyMedium.copyWith(
                  color: isSelected ? AppColors.textPrimary : AppColors.textSecondary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
