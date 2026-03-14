import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/widget/custom_card.dart';

class InvestmentCharts extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? percentageChange;
  final bool isPositive;

  const InvestmentCharts({
    super.key,
    this.title = 'Rendimiento del portafolio',
    this.subtitle,
    this.percentageChange,
    this.isPositive = true,
  });

  static List<FlSpot> get _performanceSpots => [
    const FlSpot(0, 100),
    const FlSpot(1, 108),
    const FlSpot(2, 112),
    const FlSpot(3, 105),
    const FlSpot(4, 118),
    const FlSpot(5, 125),
    const FlSpot(6, 122),
    const FlSpot(7, 135),
    const FlSpot(8, 142),
    const FlSpot(9, 155),
    const FlSpot(10, 168),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: AppSpacing.lg,
      children: [
        _buildHeader(context),
        SizedBox(height: AppSpacing.md),
        _buildChart(),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      mainAxisAlignment: .spaceBetween,
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Container(
                  padding: .all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primary.withValues(alpha: 0.3),
                        AppColors.secondaryLight.withValues(alpha: 0.3),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: .circular(AppSpacing.radiusSm),
                  ),
                  child: Icon(
                    Icons.trending_up_rounded,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  title,
                  style: context.isDesktop
                      ? AppTypography.h4.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        )
                      : AppTypography.bodyMedium.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                ),
              ],
            ),
            if (subtitle != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                subtitle!,
                style: AppTypography.caption.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ],
        ),
        if (percentageChange != null)
          Container(
            padding: .symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: (isPositive ? AppColors.success : AppColors.error)
                  .withValues(alpha: 0.15),
              borderRadius: .circular(AppSpacing.radiusFull),
            ),
            child: Row(
              mainAxisSize: .min,
              children: [
                Icon(
                  isPositive
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                  color: isPositive ? AppColors.success : AppColors.error,
                  size: 20,
                ),
                Text(
                  percentageChange!,
                  style: AppTypography.bodySmall.copyWith(
                    color: isPositive ? AppColors.success : AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildChart() {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 10,
          minY: 95,
          maxY: 175,
          lineBarsData: [
            LineChartBarData(
              spots: _performanceSpots,
              isCurved: true,
              curveSmoothness: 0.35,
              color: AppColors.primary,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primary.withValues(alpha: 0.4),
                    AppColors.primary.withValues(alpha: 0.05),
                  ],
                ),
              ),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                getTitlesWidget: (value, meta) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    value.toInt().toString(),
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) {
                  const labels = ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun'];
                  final index = value.toInt();
                  if (index >= 0 && index < labels.length) {
                    return Text(
                      labels[index],
                      style: AppTypography.caption.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 10,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 20,
            getDrawingHorizontalLine: (value) => FlLine(
              color: AppColors.textTertiary.withValues(alpha: 0.15),
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
        ),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      ),
    );
  }
}
