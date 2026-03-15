import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/user_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_typography.dart';
import 'package:investment_fund/core/util/handled_calculate_percent.dart';
import 'package:investment_fund/core/util/money_format.dart';

class CustomMobilHeader extends StatelessWidget {
  final UserModel user;
  const CustomMobilHeader({super.key, required this.user});

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
                "Cuenta de inversión",
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.background,
                  fontWeight: .bold,
                ),
              ),
              Text(
                moneyFormat(user.availableBalance.toDouble()),
                style: AppTypography.h1.copyWith(
                  color: AppColors.background,
                  fontWeight: .bold,
                ),
              ),

              Text(
                '+${moneyFormat(user.availableBalance.toDouble())} (${handledCalculatePercent(user.initialBalance.toDouble(), user.availableBalance.toDouble())}%)',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.success,
                  fontWeight: .bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
