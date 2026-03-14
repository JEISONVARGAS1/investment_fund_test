import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/widget/custom_card.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/widget/responsive_container.dart';
import 'package:investment_fund/core/extension/context_extension.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_item_card.dart';
import 'package:investment_fund/feature/home/ui/widgets/custom_item_card_gridview.dart';

class StocksPage extends StatelessWidget {
  const StocksPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          (index) => CustomItemCard(
                            title: _stocksData[index].title,
                            icon: _stocksData[index].icon,
                            subtitle: _stocksData[index].subtitle,
                            price: _stocksData[index].price,
                            percentage: _stocksData[index].percentage,
                            onTap: () => context.push(
                              '/investment/${_stocksData[index].title}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.lg),
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
                                  childAspectRatio: 1.1,
                                ),
                            itemBuilder: (context, index) =>
                                CustomItemCardGridview(
                                  title: _stocksData[index].title,
                                  icon: _stocksData[index].icon,
                                  subtitle: _stocksData[index].subtitle,
                                  percentage: _stocksData[index].percentage,
                                  onTap: () => context.push(
                                    '/investment/${_stocksData[index].title}',
                                  ),
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
      ),
    );
  }
}

const _stocksData = [
  _StockItem(
    title: 'Apple',
    icon: Icons.apple,
    subtitle: '15 unit',
    price: '\$3 450.00',
    percentage: '+\$120.00 (12%)',
  ),
  _StockItem(
    title: 'Google',
    icon: Icons.g_mobiledata,
    subtitle: '8 unit',
    price: '\$2 800.00',
    percentage: '+\$85.00 (8%)',
  ),
  _StockItem(
    title: 'Microsoft',
    icon: Icons.computer,
    subtitle: '12 unit',
    price: '\$2 100.00',
    percentage: '+\$95.00 (9%)',
  ),
  _StockItem(
    title: 'Amazon',
    icon: Icons.shopping_cart,
    subtitle: '6 unit',
    price: '\$1 890.00',
    percentage: '+\$65.00 (7%)',
  ),
  _StockItem(
    title: 'Tesla',
    icon: Icons.electric_car,
    subtitle: '10 unit',
    price: '\$2 210.80',
    percentage: '+\$150.00 (15%)',
  ),
];

class _StockItem {
  final String title;
  final IconData icon;
  final String subtitle;
  final String price;
  final String percentage;

  const _StockItem({
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.price,
    required this.percentage,
  });
}
