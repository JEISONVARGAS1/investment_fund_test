import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/feature/investment_detail/provider/investment_detail_controller.dart';

class DetailCandlestickChart extends ConsumerWidget {
  const DetailCandlestickChart({super.key});

  static const _timeRanges = ['15M', '30M', '60M', '4H', '1D', '5D', '1Y'];

  static List<CandlestickSpot> get _sampleSpots => [
        CandlestickSpot(x: 0, open: 100, high: 120, low: 95, close: 115),
        CandlestickSpot(x: 1, open: 115, high: 140, low: 110, close: 135),
        CandlestickSpot(x: 2, open: 135, high: 150, low: 125, close: 130),
        CandlestickSpot(x: 3, open: 130, high: 145, low: 120, close: 140),
        CandlestickSpot(x: 4, open: 140, high: 160, low: 135, close: 155),
        CandlestickSpot(x: 5, open: 155, high: 170, low: 150, close: 165),
        CandlestickSpot(x: 6, open: 165, high: 180, low: 160, close: 175),
        CandlestickSpot(x: 7, open: 175, high: 190, low: 170, close: 185),
        CandlestickSpot(x: 8, open: 185, high: 210, low: 180, close: 200),
        CandlestickSpot(x: 9, open: 200, high: 230, low: 195, close: 230),
      ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRange = ref.watch(investmentDetailControllerProvider).value?.selectedTimeRange ?? '5D';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _timeRanges.map((range) {
              final isSelected = range == selectedRange;
              return GestureDetector(
                onTap: () => ref.read(investmentDetailControllerProvider.notifier).setSelectedTimeRange(range),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary.withOpacity(0.2) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.textTertiary.withOpacity(0.5),
                    ),
                  ),
                  child: Text(
                    range,
                    style: AppTypography.bodySmall.copyWith(
                      color: isSelected ? AppColors.primary : AppColors.textSecondary,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 220,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CandlestickChart(
              CandlestickChartData(
                candlestickSpots: _sampleSpots,
                minX: 0,
                maxX: 9,
                minY: 90,
                maxY: 250,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 24,
                      getTitlesWidget: (value, meta) {
                        const labels = ['May', 'Jun', 'Jul', 'Aug'];
                        final index = value.toInt();
                        if (index >= 0 && index < labels.length) {
                          return Text(
                            labels[index],
                            style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                      ),
                    ),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 40,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: AppColors.textTertiary.withOpacity(0.2),
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
