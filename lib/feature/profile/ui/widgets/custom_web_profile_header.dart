import 'package:flutter/material.dart';
import 'package:investment_fund/core/model/user_model.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class CustomWebProfileHeader extends StatelessWidget {
  final UserModel user;
  const CustomWebProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        constraints: const BoxConstraints(maxWidth: 420),
        decoration: BoxDecoration(
          borderRadius: .circular(AppSpacing.radiusLg),
          boxShadow: [
            BoxShadow(
              color: AppColors.textTertiary.withValues(alpha: 0.25),
              blurRadius: 20,
              spreadRadius: 0,
              offset: Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.8),
              blurRadius: 0,
              spreadRadius: 1,
              offset: .zero,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(
                color: AppColors.textTertiary.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: .min,
              children: [
                // Franja superior tipo credencial
                Container(
                  width: .infinity,
                  padding: const .symmetric(
                    vertical: AppSpacing.md,
                    horizontal: AppSpacing.lg,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryDark,
                        AppColors.primary,
                        AppColors.secondary,
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const .all(AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: .circular(AppSpacing.radiusSm),
                        ),
                        child: const Icon(
                          Icons.verified_user_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'INVESTMENT FUND',
                              style: AppTypography.label.copyWith(
                                color: Colors.white.withValues(alpha: 0.9),
                                fontSize: 10,
                                letterSpacing: 2,
                              ),
                            ),
                            Text(
                              'Miembro verificado',
                              style: AppTypography.bodySmall.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Contenido de la credencial
                Padding(
                  padding: const .all(AppSpacing.lg),
                  child: Row(
                    crossAxisAlignment: .center,
                    children: [
                      // Foto tipo credencial
                      Container(
                        width: 88,
                        height: 110,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: .circular(AppSpacing.radiusSm),
                          border: Border.all(
                            color: AppColors.textTertiary.withValues(
                              alpha: 0.3,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 48,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.lg),
                      // Datos del usuario
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              user.name,
                              style: AppTypography.h5.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user.email,
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.md),
                           
                            const SizedBox(height: 4),
                            Text(
                              'Válida hasta: 12/2025',
                              style: AppTypography.caption.copyWith(
                                color: AppColors.textTertiary,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Franja inferior con patrón
                Container(
                  height: 6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: .centerLeft,
                      end: .centerRight,
                      colors: [
                        AppColors.primary,
                        AppColors.secondary,
                        AppColors.primaryDark,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
