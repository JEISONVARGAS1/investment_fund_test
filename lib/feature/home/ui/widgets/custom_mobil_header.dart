import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class CustomMobilHeader extends StatelessWidget {
  const CustomMobilHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
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
          padding: .symmetric(horizontal: 40),
          width: .infinity,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Broker account',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.background,
                ),
              ),
              Text(
                '\$8 900.16',
                style: AppTypography.h1.copyWith(color: AppColors.background),
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
    );
  }
}
