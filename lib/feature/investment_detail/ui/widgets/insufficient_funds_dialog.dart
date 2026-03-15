import 'package:flutter/material.dart';
import 'package:investment_fund/core/theme/app_colors.dart';
import 'package:investment_fund/core/theme/app_spacing.dart';
import 'package:investment_fund/core/theme/app_typography.dart';

class InsufficientFundsDialog extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;
  final String message;
  final VoidCallback? onAccept;
  final VoidCallback? onCancel;

  const InsufficientFundsDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.message,
    this.onAccept,
    this.onCancel,
  });

  static Future<void> show(
    BuildContext context, {
    required Color color,
    required String title,
    required IconData icon,
    required String message,
    VoidCallback? onAccept,
    VoidCallback? onCancel,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) => InsufficientFundsDialog(
        icon: icon,
        title: title,
        color: color,
        message: message,
        onAccept: onAccept,
        onCancel: onCancel,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: .symmetric(horizontal: AppSpacing.lg),
      child: Container(
        padding: .all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: .only(
            topLeft: .circular(AppSpacing.radiusLg),
            bottomRight: .circular(AppSpacing.radiusLg),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 24,
              offset: Offset(0, 8),
              color: AppColors.primaryDark.withValues(alpha: 0.15),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              padding: .all(AppSpacing.md),
              decoration: BoxDecoration(
                shape: .circle,
                color: color.withValues(alpha: 0.1),
              ),
              child: Icon(icon, size: 48, color: color),
            ),
            SizedBox(height: AppSpacing.lg),
            Text(
              title,
              style: AppTypography.h5.copyWith(
                color: AppColors.textPrimary,
                fontWeight: .w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.sm),
            Text(
              message,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: AppSpacing.xl),
            if (onAccept != null || onCancel != null)
              Row(
                children: [
                  if (onCancel != null) ...[
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onCancel,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSpacing.md,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusMd,
                            ),
                          ),
                        ),
                        child: const Text('Cancelar'),
                      ),
                    ),
                    if (onAccept != null) SizedBox(width: AppSpacing.sm),
                  ],
                  if (onAccept != null)
                    Expanded(
                      child: FilledButton(
                        onPressed: onAccept,
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.surface,
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSpacing.md,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusMd,
                            ),
                          ),
                        ),
                        child: const Text('Aceptar'),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
