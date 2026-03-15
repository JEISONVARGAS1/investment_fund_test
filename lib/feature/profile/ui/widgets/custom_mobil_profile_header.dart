import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/user_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class CustomMobilProfileHeader extends StatelessWidget {
  final UserModel user;
  const CustomMobilProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          alignment: .center,
          child: Text(
            'Perfil',
            style: AppTypography.h4.copyWith(color: AppColors.background),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const .symmetric(horizontal: 40),
          width: .infinity,
          child: Column(
            crossAxisAlignment: .center,
            children: [
              Container(
                padding: const .all(12),
                decoration: const BoxDecoration(
                  shape: .circle,
                  color: AppColors.background,
                ),
                child: Icon(Icons.person, size: 48, color: AppColors.primary),
              ),
              const SizedBox(height: 12),
              Text(
                user.name,
                style: AppTypography.h5.copyWith(
                  fontWeight: .w600,
                  color: AppColors.background,
                ),
              ),
              Text(
                user.email,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.background.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
